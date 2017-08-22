function f = prob2()
s0 = 100;
T = 1;
r = 0.08;
sg = 0.2;
M = [5 10];
M_5 = [ 0 0.2 0.4 0.6 0.8 1.0];
times = [ 1 2 3 4 5 6 ];

for i = 1:length(M)
    dt = T/M(i);
    u = exp(sg*sqrt(dt)+(r-0.5*sg*sg)*dt);
    d = exp(-(sg*sqrt(dt))+(r-0.5*sg*sg)*dt);
    a = exp(r*dt);
    p = (a-d)/(u-d);
    [lookback_option] = lookback(s0, T, M(i), u, d, dt, p, r);
    option(i) = lookback_option(1,1);
    
    if M(i) == 5
        
      %  for j = 1:1:M(i)+1
            
            fprintf('\n');
          fprintf('The value of lookback option at intermediate time points for M = 5 is : \n');
          fprintf('\n');
            disp(lookback_option);
        
      %  end
    end
    
    fprintf('\n');
    fprintf('The lookback option value at t = 0 for M = %d is = %f \n', M(i), option(i));
    fprintf('\n');
end

end

% main function

function [lookback_option] = lookback(s0, T, M, u, d, dt, p, r)
lookback_option = zeros(pow2(M), M+1);
stockprice = zeros(pow2(M), M+1);
Max = zeros(pow2(M), M+1);

stockprice(1,1) = s0;

for j = 1:1:M
    for i = 1:1:2^(j-1)
        stockprice(2*i-1,j+1) = stockprice(i,j)*u;
        stockprice(2*i, j+1) = stockprice(i,j)*d;
        Max(2*i-1, j+1) = max(stockprice(2*i-1, j+1), Max(i,j));
        Max(2*i, j+1) = max(stockprice(2*i, j+1), Max(i,j));
    end
end

for i = 1:pow2(M)
    lookback_option(i,M+1) = Max(i, M+1) - stockprice(i, M+1);
end

    for j = M:-1:1
        for i = 1:1:2^(j-1)
            lookback_option(i, j) = exp(-r*dt)*(p*lookback_option(2*i-1, j+1)+(1-p)*lookback_option(2*i, j+1));
        end
   
    end
end
