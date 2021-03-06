function [] = prob2()
    clc;
    asset_price = xlsread('price.xls');
    [M, C] = ReturnMeanCov(asset_price);
    [mean_vec, var_vec] = Markowitz_EF(M, C);
    %Part-A
    fig_name = ['\sigma vs. \mu '];
    figure('Name', fig_name);
    plot(var_vec, mean_vec, 'g');
    grid on;
    xlabel('standard deviation');
    ylabel('expected return');
    title(fig_name);
    %Part-B
    fprintf('\nB)\n\n');
    rf = 0.07;
    u = ones(1, length(M));
    wt_m = (M - (rf * u)) / C;
    wt_m = wt_m / ((M - (rf * u)) / C * u');
    ret_m = M * wt_m';
    sig_m = sqrt(wt_m * C * wt_m');
    fprintf('The Market Portfolio has weights\n');
    disp(wt_m);
    %Part-C
    fprintf('\nPart C - Figure 2\n\n');
    sigs = 0:0.01:0.3;
    rets = rf + (sigs * ((ret_m - rf) / sig_m));
    fig_name = ['\sigma vs. \mu'];
    figure('Name', fig_name);
    p = plot(sigs, rets, 'g');
    grid on
    xlabel('standard deviation');
    ylabel('expected return');
    title(fig_name);
    %Part-D
    beta_var = 0:0.1:3;
    rets = rf + (beta_var * ((ret_m - rf)));
    fig_name = ['\beta vs. \mu'];
    figure('Name', fig_name);
    p = plot(beta_var, rets, 'g');
    grid on
    xlabel('\beta');
    ylabel('\mu');
    title(fig_name);
end

function [mean_vec, cov_mat] = ReturnMeanCov(prices)
    p_size = size(prices);
    n = p_size(2);
    m = p_size(1);
    mean_vec = zeros(1, n);
    for i = 1:n
        v1 = prices(:, i);
        rets = (v1(2:m) - v1(1:m-1)) ./ v1(1:m-1);
        mean_mat(i, :) = rets;
        mean_vec(i) = mean(rets);
    end
    cov_mat = cov(mean_mat');
end
function [p_mean_vec, p_var_vec] = Markowitz_EF(mean_vec, cov_mat)
    n = length(mean_vec);
    u = ones(1, n);
    a = (u / cov_mat) * u';
    b = (u / cov_mat) * mean_vec';
    c = (mean_vec / cov_mat) * mean_vec';
    del = (a * c) - (b * b);
    p_mean_vec = 0:0.01:0.3;
    p_var_vec = (a * (p_mean_vec .^ 2)) - (2 * b * p_mean_vec) + c;
    p_var_vec = p_var_vec / del;
end
