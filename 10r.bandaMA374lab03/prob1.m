function f = prob1()
format long;
s0 = 100;
K = 100;
T = 1;
M = 100;
r = 0.08;
sg = 0.2;
s01 = 50:1:150;
K1 = 50:1:150;
r1 = 0.01:0.001:0.16;
sg1 = 0.1:0.01:0.3;
M1 = 50:1:150;
dt = T/M;
u = exp(sg*sqrt(dt)+(r-0.5*sg*sg)*dt);
d = exp(-(sg*sqrt(dt))+(r-0.5*sg*sg)*dt);
a = exp(r*dt);
p = (a-d)/(u-d);

%changing s0

for i = 1:length(s01)
   
    [American_call, American_put] = American_option(s01(i),K,T,M,r,sg,dt,u,d,p);
    call_s01(i) = American_call(1,1);
    put_s01(i) = American_put(1,1);
        
    %fprintf('The value of call option for s0(varying) = %d is = %f \n', s01(i), call_s01(1));
    %fprintf('The value of put option for s0(varying) = %d is = %f \n', s01(i), put_s01(1));
    %fprintf('\n');
end

%changing K

for i = 1:length(K1)
   
    [American_call, American_put] = American_option(s0,K1(i),T,M,r,sg,dt,u,d,p);
    call_K1(i) = American_call(1,1);
    put_K1(i) = American_put(1,1);
    
    %fprintf('The value of call option for K(varying) = %d is = %f \n', K1(i), call_K1(1));
    %fprintf('The value of put option for K(varying) = %d is = %f \n', K1(i), put_K1(1));
    %fprintf('\n');
end

%changing r

for i = 1:length(r1)
    a1(i) = exp(r1(i)*dt);
    p1(i) = (a1(i)-d)/(u-d);
    [American_call, American_put] = American_option(s0,K,T,M,r1(i),sg,dt,u,d,p1(i));
    call_r1(i) = American_call(1,1);
    put_r1(i) = American_put(1,1);
    
    %fprintf('The value of call option for r(varying) = %d is = %f \n', r1(i), call_r1(1));
    %fprintf('The value of pur option for r(varying) = %d is = %f \n', r1(i), put_r1(1));
    %fprintf('\n');
end

%changing sg

for i = 1:length(sg1)
    u1(i) = exp(sg1(i)*sqrt(dt)+(r-0.5*sg1(i)*sg1(i))*dt);
    d1(i) = exp(-(sg1(i)*sqrt(dt))+(r-0.5*sg1(i)*sg1(i))*dt);
    p1(i) = (a-d1(i))/(u-d1(i));
    [American_call, American_put] = American_option(s0,K,T,M,r,sg1(i),dt,u1(i),d1(i),p1(i));
    call_sg1(i) = American_call(1,1);
    put_sg1(i) = American_put(1,1);
    
    %fprintf('The value of call option for sigma(varying) = %d is = %f \n', sg1(i), call_sg1(1));
    %fprintf('The value of put option for sigma(varying) = %d is = %f \n', sg1(i), put_sg1(1));
    %fprintf('\n');
end

%for K = 95

  for i = 1:length(M1)
    dt1(i) = T/M1(i);
    u2(i) = exp(sg*sqrt(dt1(i))+(r-0.5*sg*sg)*dt1(i));
    d2(i) = exp(-(sg*sqrt(dt1(i)))+(r-0.5*sg*sg)*dt1(i));
    a2(i) = exp(r*dt1(i));
    p2(i) = (a2(i) - d2(i))/(u2(i) - d2(i));
    [American_call, American_put] = American_option(s0,95,T,M1(i),r,sg,dt1(i),u2(i),d2(i),p2(i));
    call_M1_K95(i) = American_call(1,1);
    put_M1_K95(i) = American_put(1,1);
    
    %fprintf('The value of call option for M (varying) = %d for K = 95 is = %f \n', M1(i), call_M1_K95(i));
    %fprintf('The value of put option for M (varying) = %d for K = 95 is = %f \n', M1(i), put_M1_K95(i));
    %fprintf('\n');
  end
 
  %for K = 100
  
  for i = 1:length(M1)
    dt1(i) = T/M1(i);
    u2(i) = exp(sg*sqrt(dt1(i))+(r-0.5*sg*sg)*dt1(i));
    d2(i) = exp(-(sg*sqrt(dt1(i)))+(r-0.5*sg*sg)*dt1(i));
    a2(i) = exp(r*dt1(i));
    p2(i) = (a2(i) - d2(i))/(u2(i) - d2(i));
    [American_call, American_put] = American_option(s0,100,T,M1(i),r,sg,dt1(i),u2(i),d2(i),p2(i));
    call_M1_K100(i) = American_call(1,1);
    put_M1_K100(i) = American_put(1,1);
    
    %fprintf('The value of call option for M (varying) = %d for K = 100 is = %f \n', M1(i), call_M1_K100(i));
    %fprintf('The value of put option for M (varying) = %d for K = 100 is = %f \n', M1(i), put_M1_K100(i));
    %fprintf('\n');
  end
  
  %for K = 105
  
  for i = 1:length(M1)
    dt1(i) = T/M1(i);
    u2(i) = exp(sg*sqrt(dt1(i))+(r-0.5*sg*sg)*dt1(i));
    d2(i) = exp(-(sg*sqrt(dt1(i)))+(r-0.5*sg*sg)*dt1(i));
    a2(i) = exp(r*dt1(i));
    p2(i) = (a2(i) - d2(i))/(u2(i) - d2(i));
    [American_call, American_put] = American_option(s0,105,T,M1(i),r,sg,dt1(i),u2(i),d2(i),p2(i));
    call_M1_K105(i) = American_call(1,1);
    put_M1_K105(i) = American_put(1,1);
    
    %fprintf('The value of call option for M (varying) = %d for K = 105 is = %f \n', M1(i), call_M1_K105(i));
    %fprintf('The value of put option for M (varying) = %d for K = 105 is = %f \n', M1(i), put_M1_K105(i));
    %fprintf('\n');
  end
  
  fprintf('\n');
  fprintf('The initial value of American call option for the specifically mentioned data is : %f  \n', call_s01(51));
  fprintf('\n');
  fprintf('The initial value of American put option for the specifically mentioned data is : %f \n', put_s01(51));
  fprintf('\n');
  
  % plots
  
  index = 0;
  index = index+1;
  figure(index);
  plot(s01, call_s01, 'g');
  hold on;
  plot(s01, put_s01, 'r'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying s0 values');
  xlabel('value of s0');
  ylabel('value of options at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(K1, call_K1, 'g');
  hold on;
  plot(K1, put_K1, 'r'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying K values');
  xlabel('value of K');
  ylabel('value of options at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(r1, call_r1, 'g');
  hold on;
  plot(r1, put_r1, 'r'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying r values');
  xlabel('Value of r');
  ylabel('value of options at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(sg1, call_sg1, 'g');
  hold on;
  plot(sg1, put_sg1, 'r'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying sigma values');
  xlabel('Value of sigma');
  ylabel('value of options at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(M1, call_M1_K95, 'g');
  title('Plot of value of call option at t = 0 for varying M values at K = 95');
  xlabel('Value of M');
  ylabel('value of call at t = 0');
  
  index = index+1;
  figure(index);
  plot(M1, put_M1_K95, 'g');
  title('Plot of value of put option at t = 0 for varying M values at K = 95');
  xlabel('Value of M');
  ylabel('value of put at t = 0');
  
  index = index+1;
  figure(index);
  plot(M1, call_M1_K100, 'g');
  title('Plot of value of call option at t = 0 for varying M values at K = 100');
  xlabel('Value of M');
  ylabel('value of call at t = 0');
  
  index = index+1;
  figure(index);
  
  plot(M1, put_M1_K100, 'g');
  title('Plot of value of put option at t = 0 for varying M values at K = 100');
  xlabel('Value of M');
  ylabel('value of put at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(M1, call_M1_K105, 'g');
  title('Plot of value of call option at t = 0 for varying M values at K = 105');
  xlabel('Value of M');
  ylabel('value of call at t = 0');
  
  index = index+1;
  figure(index);
  plot(M1, put_M1_K105, 'g');
  title('Plot of value of put option at t = 0 for varying M values at K = 105');
  xlabel('Value of M');
  ylabel('value of put at t = 0');
  
end
  
  %main function

  function [American_call, American_put] = American_option(s0,K,T,M,r,sg,dt,u,d,p)
  American_call = zeros(M+1,M+1);
  American_put = zeros(M+1,M+1);
  stockprice = zeros(M+1,M+1);
  
  for j = M+1:-1:2
    for i = 1:1:j
      stockprice(i,j) = s0*d^(i-1)*u^(j-i);
    end
  end
  
  stockprice(1,1) = s0;
  
  for i = 1:M+1
      American_call(i,M+1) = max(0, stockprice(i,M+1)-K);
      American_put(i,M+1) = max(0, K - stockprice(i,M+1));
  end
  
  for j = M:-1:1
      for i = 1:1:j
          American_call(i,j) = max(max(0,stockprice(i,j)-K),exp(-r*dt)*(p*American_call(i,j+1)+(1-p)*American_call(i+1,j+1)));
          American_put(i,j) = max(max(0,K-stockprice(i,j)),exp(-r*dt)*(p*American_put(i,j+1)+(1-p)*American_put(i+1,j+1)));
      end
  end
  end
