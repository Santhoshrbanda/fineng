function [] = lab5()
%%	PART - 1
	z = [0.1 ; 0.2 ; 0.15];
	s = [0.005 -0.010 0.004 ; -0.010 0.040 -0.002 ; 0.004 -0.002 0.023];
	
	figure(1);
	hold on;
	makeCurve(z, s, '-b');
	makeCurve(z(2:3, 1), s(2:3, 2:3), '-r');
	makeCurve(z([1, 3], 1), s([1, 3], [1, 3]), '-g');
	makeCurve(z(1:2, 1), s(1:2, 1:2), '-c');
	hold off;
	
	mu = 0 : 0.001 : 1.0;
	k = round(1);
	w = zeros(1, 3);
	for i=1:length(mu)
		[mu_s, std_s, w_s] = findPortfolio(mu(i), z, s);
		poss = 1;
		for j=1:length(w_s)
			if(w_s(j)<0)
				poss = 0;
			end
		end
		if(poss == 1)
			w(k, :) = w_s;
			k = k + 1;
		end
	end
	
	figure(2);
	plot(w(:, 2), w(:, 3), '-b');
	hold on;
	plot([0, 0], [0, 1], '-g');
	plot([0, 1], [0, 0], '-r');
	plot([0, 1], [1, 0], '-m');
	axis([-0.1 1 -0.1 1]);
	hold off;
	
%%	PART - 2
	data_1 = csvread('bse.csv');
	data_2 = csvread('nse.csv');
	index_1 = csvread('sensex.csv');
	index_2 = csvread('nifty.csv');
	
	cols = 10;
	rows = 96;
	
	index_1(1, 1) = 0;
	for i=rows:2
		index_1(i, 1) = (index_1(i, 1) - index_1(i-1, 1))/index_1(i-1, 1);
	end
	
	index_2(1, 1) = 0;
	for i=rows:2
		index_2(i, 1) = (index_2(i, 1) - index_2(i-1, 1))/index_2(i-1, 1);
	end
	
	for j=1:cols
		for i=rows:2
			data_1(i, j) = (data_1(i, j) - data_1(i-1, j))/data_1(i-1, j);
		end
		data_1(1, j) = 0;
	end
	
	for j=1:cols
		for i=rows:2
			data_2(i, j) = (data_2(i, j) - data_2(i-1, j))/data_2(i-1, j);
		end
		data_2(1, j) = 0;
	end

	index_1_m = mean(index_1);
	index_2_m = mean(index_2);
	
	z_1 = mean(data_1);
	z_1 = z_1';
	
	z_2 = mean(data_2);
	z_2 = z_2';
	
	mu_rf = 0.07;
	
%%	BSE - SENSEX
	fprintf('============= BSE-SENSEX =============\n');
	for i=1:cols
		beta_1 = ((z_1(i) - mu_rf)/(index_1_m - mu_rf));
		beta_2 = ((z_2(i) - mu_rf)/(index_1_m - mu_rf));
		fprintf('Beta of stock %g in BSE: %g\n', i, beta_1);
		fprintf('Beta of stock %g in NSE: %g\n', i, beta_2);
	end
	
%%	NSE - NIFTY
	fprintf('============= NSE-NIFTY =============\n');
	for i=1:cols
		beta_1 = ((z_1(i) - mu_rf)/(index_2_m - mu_rf));
		beta_2 = ((z_2(i) - mu_rf)/(index_2_m - mu_rf));
		fprintf('Beta of stock %g in BSE: %g\n', i, beta_1);
		fprintf('Beta of stock %g in NSE: %g\n', i, beta_2);
	end
end

%% FUNCTION
function [] = makeCurve(z, s, col)
	stdevs = sqrt(diag(s));
	u = ones(length(z), 1);
	
	a = u'*s^-1*u;
	b = u'*s^-1*z;
	c = z'*s^-1*z;
	d = a*c - b^2;
	
	n = 100;
	v = b/a;
	mu = 0.1*v : 0.9*v/n : 0.22;
	var = ((a*mu.^2) - (2*b*mu) + c)/d;
	std = sqrt(var);

	plot(std, mu, col);
	plot(stdevs, z, 'dk');
	title('Efficient Frontier with Individual Securities', 'fontsize', 10);
	ylabel('Expected Return (%)', 'fontsize', 10);
	xlabel('Standard Deviation (%)', 'fontsize', 10);
end

%%	FUNCTION
function [mu_s, std_s, w_s] = findPortfolio(mu_tar, z, s)
	u = ones(length(z), 1);
	
	a = u'*s^-1*u;
	b = u'*s^-1*z;
	c = z'*s^-1*z;
	d = a*c - b^2;
	
	lambda = (c - mu_tar*b)/d;
	gamma = (mu_tar*a - b)/d;
	
	w_g = (s^-1*u)/a;
	w_d = (s^-1*z)/b;
	
	w_s = (lambda*a)*w_g + (gamma*b)*w_d;
	mu_s = w_s'*z;
	std_s = sqrt(w_s'*s*w_s);
end
