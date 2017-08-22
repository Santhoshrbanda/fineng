function a = prob()
format short;
s0 = 9;
K = 10;
r = 0.06;
sg = 0.3;
T = 3;
M = [1 5 10 20 50 100 200 400];
t = [0 0.30 0.75 1.50 2.70];
times_t = [1 3 6 11 19];
M_1 = 1:1:400;
M_5 = 1:5:400;

%part_1

for i = 1:length(M)
    dt = T/M(i);
    u = exp((sg*sqrt(dt))+(r-0.5*sg*sg)*dt);
    d = exp(-(sg*sqrt(dt))+(r-0.5*sg*sg)*dt);
    p = (exp(r*dt)-d)/(u-d);
    [European_call, European_put] = European_option(s0,K,r,sg,T,M(i),dt,u,d,p);
    call(i) = European_call(1,1);
    put(i) = European_put(1,1);
end


%part_2

for i = 1:length(M_1)
    dt = T/M_1(i);
    u = exp((sg*sqrt(dt))+(r-0.5*sg*sg)*dt);
    d = exp(-(sg*sqrt(dt))+(r-0.5*sg*sg)*dt);
    p = (exp(r*dt)-d)/(u-d);
    [European_call, European_put] = European_option(s0,K,r,sg,T,M_1(i),dt,u,d,p);
    call_1(i) = European_call(1,1);
    put_1(i) = European_put(1,1);
    
    
end


for i = 1:length(M_5)
    dt = T/M_5(i);
    u = exp((sg*sqrt(dt))+(r-0.5*sg*sg)*dt);
    d = exp(-(sg*sqrt(dt))+(r-0.5*sg*sg)*dt);
    p = (exp(r*dt)-d)/(u-d);
    [European_call, European_put] = European_option(s0,K,r,sg,T,M_5(i),dt,u,d,p);
    call_5(i) = European_call(1,1);
    put_5(i) = European_put(1,1);
end


%part_2_plots

index = 0;
index = index+1;
figure(index);

plot(M_1,call_1,'g');
title('plot of t vs M(1-400) of call option for M with stepsize 1')
xlabel('value of M')
ylabel('value of call option at t=0 ')
grid on;

index = index+1;
figure(index);
plot(M_1, put_1, 'g');
title('plot of t vs M(1-400) of put option for M with stepsize 1')
xlabel('value of M')
ylabel('value of put option at t=0 ')
grid on;

index = index+1;
figure(index);

plot(M_5,call_5,'g');
title('plot of t vs M(1-400) of call option for M with stepsize 5')
xlabel('value of M')
ylabel('value of call option at t=0 ')
grid on;

index = index+1;
figure(index);

plot(M_5,put_5,'g');
title('plot of t vs M(1-400) of put option for M with stepsize 5')
xlabel('value of M')
ylabel('value of put option at t=0 ')
grid on;

 
%part_3

    dt = T/20;
    u = exp((sg*sqrt(dt))+(r-0.5*sg*sg)*dt);
    d = exp(-(sg*sqrt(dt))+(r-0.5*sg*sg)*dt);
    p = (exp(r*dt)-d)/(u-d);
    [European_call, European_put] = European_option(s0,K,r,sg,T,20,dt,u,d,p);
    
    for i = 1:length(t)
        fprintf('The call option value at t = %d for M = 20 is \n', t(i));
        disp(European_call(1:times_t(i), times_t(i)));
        
        fprintf('The put option value at t = %d for M = 20 is \n', t(i));
        disp(European_put(1:times_t(i), times_t(i)));
    end
end
function [European_call, European_put] = European_option(s0,K,r,sg,T,M,dt,u,d,p)
European_call = zeros(M+1,M+1);
European_put = zeros(M+1,M+1);
    for i = 1:M+1
        sn = s0*d^(i-1)*u^(M-i+1);
        European_call(i,M+1) = max(0,sn-K);
        European_put(i,M+1) = max(0,K-sn);
    end
    
    for i = M:-1:1
        for j = 1:1:i
            European_call(j,i) = exp(-r*dt)*(p*European_call(j,i+1)+(1-p)*European_call(j+1,i+1));
            European_put(j,i) = exp(-r*dt)*(p*European_put(j,i+1)+(1-p)*European_put(j+1,i+1));
        end
    end
    fprintf('for M = %d , the value of call option is %f \n', M, European_call(1,1));
    fprintf('for M = %d , the value of put option is %f \n', M, European_put(1,1));
    fprintf('\n');
end
