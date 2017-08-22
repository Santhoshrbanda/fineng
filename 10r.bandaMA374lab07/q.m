function [] = q()
strikeprice = 1;
T = 1;
r = 0.05;
sg = 0.6;
t = [0 0.2 0.4 0.6 0.8 1];
s = 0.5:0.01:1.5;
call = zeros(length(t),length(s));
put = zeros(length(t),length(s));

for i = 1:length(s)
    for j = 1:length(t)
        [call1, put1] = q1(s(i), strikeprice, T, t(j), r, sg);
        call(j,i) = call1;
        put(j,i) = put1;
    end
end

% plot call and put prices against asset price
colors = ['r', 'm', 'b', 'k', 'g', 'c'];
figure
for i=1:length(t)
    plot(s, call(i,:), colors(i))
    hold on
end
hold off
title('C(t,s) against s')
legend(num2str(t'))

figure
for i=1:length(t)
    plot(s, put(i,:), colors(i))
    hold on
end
hold off
title('P(t,s) against s')
legend(num2str(t'))

% plot call and put prices against asset price and time
figure
stem3(s, t, call, 'r')
title('3D plot for call option')
xlabel('Asset price')
ylabel('Time')
zlabel('Option price')

figure
stem3(s, t, put, 'r')
title('3D plot for put option')
xlabel('Asset price')
ylabel('Time')
zlabel('Option price')


% part 3
% surface plot of call option prices
figure
surf(s, t, call)
title('3D plot for call option')
xlabel('Asset price')
ylabel('Time')
zlabel('Option price')

% surface plot of put option prices
figure
surf(s, t, put)
title('3D plot for put option')
xlabel('Asset price')
ylabel('Time')
zlabel('Option price')


% part 4
assetp = 1;
% sensitivity of call and put prices against time to expiration
periodvalues = 1:0.01:5;
call_time = zeros(length(t), length(periodvalues));
put_time = zeros(length(t), length(periodvalues));
for i=1:length(periodvalues)
    for j=1:length(t)
        [call_time(j,i), put_time(j,i)] = q1(assetp, strikeprice, periodvalues(i), t(j), r, sg);
    end
end
figure
for i=1:length(t)
    plot(periodvalues, call_time(i,:), colors(i))
    hold on
end
title('Sensitivity of Call option to Time before expiry')
xlabel('Time before expiry')
ylabel('Call option price')
legend(num2str(t'))
figure
for i=1:length(t)
    plot(periodvalues, put_time(i,:), colors(i))
    hold on
end
title('Sensitivity of Put option to Time before expiry')
xlabel('Time before expiry')
ylabel('Put option price')
legend(num2str(t'))


% sensitivity of call and put prices against strike price
strikevalues = 0.75:0.01:1.25;
call_strike = zeros(length(t), length(strikevalues));
put_strike = zeros(length(t), length(strikevalues));
for i=1:length(strikevalues)
    for j=1:length(t)
        [call_strike(j,i), put_strike(j,i)] = q1(assetp, strikevalues(i), T, t(j), r, sg);
    end
end
figure
for i=1:length(t)
    plot(strikevalues, call_strike(i,:), colors(i))
    hold on
end
title('Sensitivity of Call option to Strike price')
xlabel('Strike price')
ylabel('Call option price')
legend(num2str(t'))
figure
for i=1:length(t)
    plot(strikevalues, put_strike(i,:), colors(i))
    hold on
end
title('Sensitivity of Put option price to Strike price')
xlabel('Strike price')
ylabel('Put option price')
legend(num2str(t'))

% sensitivity of call and put prices against rate
rates = 0.05:0.01:0.20;
call_rates = zeros(length(t), length(rates));
put_rates = zeros(length(t), length(rates));
for i=1:length(rates)
    for j=1:length(t)
        [call_rates(j,i), put_rates(j,i)] = q1(assetp, strikeprice, T, t(j), rates(i), sg);
    end
end
figure
for i=1:length(t)
    plot(rates, call_rates(i,:), colors(i))
    hold on
end
title('Sensitivity of Call option to rate')
xlabel('Rates')
ylabel('Call option price')
legend(num2str(t'))
figure
for i=1:length(t)
    plot(rates, put_rates(i,:), colors(i))
    hold on
end
title('Sensitivity of Put option to rate')
xlabel('Rates')
ylabel('Put option price')
legend(num2str(t'))

% sensitivity of call and put prices against volatility
volatility = 0.40:0.01:0.80;
call_vol = zeros(length(t), length(volatility));
put_vol = zeros(length(t), length(volatility));
for i=1:length(volatility)
    for j=1:length(t)
        [call_vol(j,i), put_vol(j,i)] = q1(assetp, strikeprice, T, t(j), r, volatility(i));
    end
end
figure
for i=1:length(t)
    plot(volatility, call_vol(i,:), colors(i));
    hold on
end
title('Sensitivity of Call option to volatility')
xlabel('Volatility')
ylabel('Call option price')
legend(num2str(t'))
figure
for i=1:length(t)
    plot(volatility, put_vol(i,:), colors(i))
    hold on
end
title('Sensitivity of Put option to volatility')
xlabel('Volatility')
ylabel('Put option price')
legend(num2str(t'))

% 3d plots
% call against time and period
figure
surf(periodvalues, t, call_time);
title('Call option prices against time and period')
xlabel('Time period')
ylabel('Time')
zlabel('Call option')
% put against time and period
figure
surf(periodvalues, t, put_time);
title('Put option prices against time and period')
xlabel('Time period')
ylabel('Time')
zlabel('Put option')

% call against time and strike
figure
surf(strikevalues, t, call_strike);
title('Call option prices against time and strike price')
xlabel('Strike price')
ylabel('Time')
zlabel('Call option')
% put against time and strike
figure
surf(strikevalues, t, put_strike);
title('Put option prices against time and strike price')
xlabel('Strike price')
ylabel('Time')
zlabel('Put option')

% call against time and rate
figure
surf(rates, t, call_rates);
title('Call option prices against time and rate')
xlabel('Rates')
ylabel('Time')
zlabel('Call option')
% put against time and rate
figure
surf(rates, t, put_rates);
title('Put option prices against time and rate')
xlabel('Rates')
ylabel('Time')
zlabel('Put option')

% call against time and volatility
figure
surf(volatility, t, call_vol);
title('Call option prices against time and volatility')
xlabel('Volatility')
ylabel('Time')
zlabel('Call option')
% put against time and volatility
figure
surf(volatility, t, put_vol);
title('Put option prices against time and volatility')
xlabel('Volatility')
ylabel('Time')
zlabel('Put option')
