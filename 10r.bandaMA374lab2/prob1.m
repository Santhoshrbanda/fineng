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
u = exp(sg*sqrt(dt));
d = exp(-(sg*sqrt(dt)));
un = exp(sg*sqrt(dt)+(r - 0.5*sg*sg)*dt);
dn = exp((-sg*sqrt(dt))+(r - 0.5*sg*sg)*dt);
a = exp(r*dt);
p = (a-d)/(u-d);
pn = (a-dn)/(un-dn);

%changing s0
for k = 1:1:2
  if k == 1
   for i = 1:length(s01)
   
    [European_call, European_put] = European_option(s01(i),K,T,M,r,sg,dt,u,d,p);
    call_s01(i) = European_call(1,1);
    put_s01(i) = European_put(1,1);
        
    %fprintf('The value of call option for s0(varying) = %d is = %f \n', s01(i), call_s01(1));
    %fprintf('The value of put option for s0(varying) = %d is = %f \n', s01(i), put_s01(1));
    %fprintf('\n');
end

%changing K

for i = 1:length(K1)
   
    [European_call, European_put] = European_option(s0,K1(i),T,M,r,sg,dt,u,d,p);
    call_K1(i) = European_call(1,1);
    put_K1(i) = European_put(1,1);
    
    %fprintf('The value of call option for K(varying) = %d is = %f \n', K1(i), call_K1(1));
    %fprintf('The value of put option for K(varying) = %d is = %f \n', K1(i), put_K1(1));
    %fprintf('\n');
end

%changing r

for i = 1:length(r1)
    a1(i) = exp(r1(i)*dt);
    p1(i) = (a1(i)-d)/(u-d);
    [European_call, European_put] = European_option(s0,K,T,M,r1(i),sg,dt,u,d,p1(i));
    call_r1(i) = European_call(1,1);
    put_r1(i) = European_put(1,1);
    
    %fprintf('The value of call option for r(varying) = %d is = %f \n', r1(i), call_r1(1));
    %fprintf('The value of pur option for r(varying) = %d is = %f \n', r1(i), put_r1(1));
    %fprintf('\n');
end

%changing sg

for i = 1:length(sg1)
    u1(i) = exp(sg1(i)*sqrt(dt));
    d1(i) = exp(-(sg1(i)*sqrt(dt)));
    p1(i) = (a-d1(i))/(u-d1(i));
    [European_call, European_put] = European_option(s0,K,T,M,r,sg1(i),dt,u1(i),d1(i),p1(i));
    call_sg1(i) = European_call(1,1);
    put_sg1(i) = European_put(1,1);
    
    %fprintf('The value of call option for sigma(varying) = %d is = %f \n', sg1(i), call_sg1(1));
    %fprintf('The value of put option for sigma(varying) = %d is = %f \n', sg1(i), put_sg1(1));
    %fprintf('\n');
end

%for K = 95

  for i = 1:length(M1)
    dt1(i) = T/M1(i);
    u2(i) = exp(sg*sqrt(dt1(i)));
    d2(i) = exp(-(sg*sqrt(dt1(i))));
    a2(i) = exp(r*dt1(i));
    p2(i) = (a2(i) - d2(i))/(u2(i) - d2(i));
    [European_call, European_put] = European_option(s0,95,T,M1(i),r,sg,dt1(i),u2(i),d2(i),p2(i));
    call_M1_K95(i) = European_call(1,1);
    put_M1_K95(i) = European_put(1,1);
    
    %fprintf('The value of call option for M (varying) = %d for K = 95 is = %f \n', M1(i), call_M1_K95(i));
    %fprintf('The value of put option for M (varying) = %d for K = 95 is = %f \n', M1(i), put_M1_K95(i));
    %fprintf('\n');
  end
 
  %for K = 100
  
  for i = 1:length(M1)
    dt1(i) = T/M1(i);
    u2(i) = exp(sg*sqrt(dt1(i)));
    d2(i) = exp(-(sg*sqrt(dt1(i))));
    a2(i) = exp(r*dt1(i));
    p2(i) = (a2(i) - d2(i))/(u2(i) - d2(i));
    [European_call, European_put] = European_option(s0,100,T,M1(i),r,sg,dt1(i),u2(i),d2(i),p2(i));
    call_M1_K100(i) = European_call(1,1);
    put_M1_K100(i) = European_put(1,1);
    
    %fprintf('The value of call option for M (varying) = %d for K = 100 is = %f \n', M1(i), call_M1_K100(i));
    %fprintf('The value of put option for M (varying) = %d for K = 100 is = %f \n', M1(i), put_M1_K100(i));
    %fprintf('\n');
  end
  
  %for K = 105
  
  for i = 1:length(M1)
    dt1(i) = T/M1(i);
    u2(i) = exp(sg*sqrt(dt1(i)));
    d2(i) = exp(-(sg*sqrt(dt1(i))));
    a2(i) = exp(r*dt1(i));
    p2(i) = (a2(i) - d2(i))/(u2(i) - d2(i));
    [European_call, European_put] = European_option(s0,105,T,M1(i),r,sg,dt1(i),u2(i),d2(i),p2(i));
    call_M1_K105(i) = European_call(1,1);
    put_M1_K105(i) = European_put(1,1);
    
    %fprintf('The value of call option for M (varying) = %d for K = 105 is = %f \n', M1(i), call_M1_K105(i));
    %fprintf('The value of put option for M (varying) = %d for K = 105 is = %f \n', M1(i), put_M1_K105(i));
    %fprintf('\n');
  end
  
  fprintf('\n');
  fprintf('The initial value of call option for the specifically mentioned data for u, d set 1 is : %f  \n', call_s01(51));
  fprintf('\n');
  fprintf('The initial value of put option for the specifically mentioned data for u, d set 1 is : %f \n', put_s01(51));
  fprintf('\n');
  
  % plots
  
  index = 0;
  index = index+1;
  figure(index);
  plot(s01, call_s01, 'g');
  hold on;
  plot(s01, put_s01, 'b'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying s0 values');
  xlabel('value of s0');
  ylabel('value at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(K1, call_K1, 'g');
  hold on;
  plot(K1, put_K1, 'b'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying K values');
  xlabel('value of K');
  ylabel('value at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(r1, call_r1, 'g');
  hold on;
  plot(r1, put_r1, 'b'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying r values');
  xlabel('Value of r');
  ylabel('value of at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(sg1, call_sg1, 'g');
  hold on;
  plot(sg1, put_sg1, 'b'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying sigma values');
  xlabel('Value of sigma');
  ylabel('value at t = 0');
  
  
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
  
  else
      
  for i = 1:length(s01)
   
    [European_call, European_put] = European_option(s01(i),K,T,M,r,sg,dt,un,dn,pn);
    call_s02(i) = European_call(1,1);
    put_s02(i) = European_put(1,1);
        
    %fprintf('The value of call option for s0(varying) = %d is = %f \n', s01(i), call_s01(1));
    %fprintf('The value of put option for s0(varying) = %d is = %f \n', s01(i), put_s01(1));
    %fprintf('\n');
  end

%changing K

for i = 1:length(K1)
   
    [European_call, European_put] = European_option(s0,K1(i),T,M,r,sg,dt,un,dn,pn);
    call_K2(i) = European_call(1,1);
    put_K2(i) = European_put(1,1);
    
    %fprintf('The value of call option for K(varying) = %d is = %f \n', K1(i), call_K1(1));
    %fprintf('The value of put option for K(varying) = %d is = %f \n', K1(i), put_K1(1));
    %fprintf('\n');
end

%changing r

for i = 1:length(r1)
    a1n(i) = exp(r1(i)*dt);
    p1n(i) = (a1(i)-dn)/(un-dn);
    [European_call, European_put] = European_option(s0,K,T,M,r1(i),sg,dt,un,dn,p1n(i));
    call_r2(i) = European_call(1,1);
    put_r2(i) = European_put(1,1);
    
    %fprintf('The value of call option for r(varying) = %d is = %f \n', r1(i), call_r1(1));
    %fprintf('The value of pur option for r(varying) = %d is = %f \n', r1(i), put_r1(1));
    %fprintf('\n');
end

%changing sg

for i = 1:length(sg1)
    u1n(i) = exp(sg1(i)*sqrt(dt)+(r-0.5*sg1(i)*sg1(i))*dt);
    d1n(i) = exp(-(sg1(i)*sqrt(dt))+(r-0.5*sg1(i)*sg1(i))*dt);
    p1n(i) = (a-d1(i))/(u-d1(i));
    [European_call, European_put] = European_option(s0,K,T,M,r,sg1(i),dt,u1n(i),d1n(i),p1n(i));
    call_sg2(i) = European_call(1,1);
    put_sg2(i) = European_put(1,1);
    
    %fprintf('The value of call option for sigma(varying) = %d is = %f \n', sg1(i), call_sg1(1));
    %fprintf('The value of put option for sigma(varying) = %d is = %f \n', sg1(i), put_sg1(1));
    %fprintf('\n');
end

%for K = 95

  for i = 1:length(M1)
    dt1n(i) = T/M1(i);
    u2n(i) = exp(sg*sqrt(dt1(i))+(r-0.5*sg*sg)*dt1(i));
    d2n(i) = exp(-(sg*sqrt(dt1(i)))+(r-0.5*sg*sg)*dt1(i));
    a2n(i) = exp(r*dt1(i));
    p2n(i) = (a2n(i) - d2(i))/(u2(i) - d2(i));
    [European_call, European_put] = European_option(s0,95,T,M1(i),r,sg,dt1n(i),u2n(i),d2n(i),p2n(i));
    call_M2_K95(i) = European_call(1,1);
    put_M2_K95(i) = European_put(1,1);
    
    %fprintf('The value of call option for M (varying) = %d for K = 95 is = %f \n', M1(i), call_M1_K95(i));
    %fprintf('The value of put option for M (varying) = %d for K = 95 is = %f \n', M1(i), put_M1_K95(i));
    %fprintf('\n');
  end
 
  %for K = 100
  
  for i = 1:length(M1)
    dt1n(i) = T/M1(i);
    u2n(i) = exp(sg*sqrt(dt1(i))+(r-0.5*sg*sg)*dt1(i));
    d2n(i) = exp(-(sg*sqrt(dt1(i)))+(r-0.5*sg*sg)*dt1(i));
    a2n(i) = exp(r*dt1(i));
    p2n(i) = (a2n(i) - d2(i))/(u2(i) - d2(i));
    [European_call, European_put] = European_option(s0,100,T,M1(i),r,sg,dt1n(i),u2n(i),d2n(i),p2n(i));
    call_M2_K100(i) = European_call(1,1);
    put_M2_K100(i) = European_put(1,1);
    
    %fprintf('The value of call option for M (varying) = %d for K = 100 is = %f \n', M1(i), call_M1_K100(i));
    %fprintf('The value of put option for M (varying) = %d for K = 100 is = %f \n', M1(i), put_M1_K100(i));
    %fprintf('\n');
  end
  
  %for K = 105
  
  for i = 1:length(M1)
    dt1n(i) = T/M1(i);
    u2n(i) = exp(sg*sqrt(dt1(i))+(r-0.5*sg*sg)*dt1(i));
    d2n(i) = exp(-(sg*sqrt(dt1(i)))+(r-0.5*sg*sg)*dt1(i));
    a2n(i) = exp(r*dt1(i));
    p2n(i) = (a2n(i) - d2(i))/(u2(i) - d2(i));
    [European_call, European_put] = European_option(s0,105,T,M1(i),r,sg,dt1n(i),u2n(i),d2n(i),p2n(i));
    call_M2_K105(i) = European_call(1,1);
    put_M2_K105(i) = European_put(1,1);
    
    %fprintf('The value of call option for M (varying) = %d for K = 105 is = %f \n', M1(i), call_M1_K105(i));
    %fprintf('The value of put option for M (varying) = %d for K = 105 is = %f \n', M1(i), put_M1_K105(i));
    %fprintf('\n');
  end
  
  fprintf('\n');
  fprintf('The initial value of call option for the specifically mentioned data for u, d set 2 is : %f  \n', call_s02(51));
  fprintf('\n');
  fprintf('The initial value of put option for the specifically mentioned data for u, d set 2 is : %f \n', put_s02(51));
  fprintf('\n');

   % plots
  
  %indexx = 0;
  index = index+1;
  figure(index);
  plot(s01, call_s02, 'g');
  hold on;
  plot(s01, put_s02, 'b'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying s0 values');
  xlabel('value of s0');
  ylabel('value at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(K1, call_K2, 'g');
  hold on;
  plot(K1, put_K2, 'b'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying K values');
  xlabel('value of K');
  ylabel('value at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(r1, call_r2, 'g');
  hold on;
  plot(r1, put_r2, 'b'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying r values');
  xlabel('Value of r');
  ylabel('value of at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(sg1, call_sg2, 'g');
  hold on;
  plot(sg1, put_sg2, 'b'), legend('call', 'put');
  title('Plot of value of call and put options at t = 0 for varying sigma values');
  xlabel('Value of sigma');
  ylabel('value at t = 0');
  
  
  index = index+1;
  figure(index);
  plot(M1, call_M2_K95, 'g');
  title('Plot of value of call option at t = 0 for varying M values at K = 95');
  xlabel('Value of M');
  ylabel('value of call at t = 0');
  
  index = index+1;
  figure(index);
  plot(M1, put_M2_K95, 'g');
  title('Plot of value of put option at t = 0 for varying M values at K = 95');
  xlabel('Value of M');
  ylabel('value of put at t = 0');
  
  index = index+1;
  figure(index);
  plot(M1, call_M2_K100, 'g');
  title('Plot of value of call option at t = 0 for varying M values at K = 100');
  xlabel('Value of M');
  ylabel('value of call at t = 0');
  
  index = index+1;
  figure(index);
  plot(M1, put_M2_K100, 'g');
  title('Plot of value of put option at t = 0 for varying M values at K = 100');
  xlabel('Value of M');
  ylabel('value of put at t = 0');
  
  index = index+1;
  figure(index);
  plot(M1, call_M2_K105, 'g');
  title('Plot of value of call option at t = 0 for varying M values at K = 105');
  xlabel('Value of M');
  ylabel('value of call at t = 0');
  
  index = index+1;
  figure(index);
  plot(M1, put_M2_K105, 'g');
  title('Plot of value of put option at t = 0 for varying M values at K = 105');
  xlabel('Value of M');
  ylabel('value of put at t = 0');
  
end
end
end

  %main function

  function [European_call, European_put] = European_option(s0,K,T,M,r,sg,dt,u,d,p)
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
  end
