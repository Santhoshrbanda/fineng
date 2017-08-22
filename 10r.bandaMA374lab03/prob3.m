function f = prob3()
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
    [Markov] = Markovian(s0, T, M(i),sg, u, d, dt, p, r);
    option(i) = Markov(1,1);
    
    if M(i) == 5
        
      %  for j = 1:1:M(i)+1
            
            fprintf('\n');
          fprintf('The value of lookback option at intermediate time points for M = 5 is : \n');
          fprintf('\n');
            disp(Markov);
        
      %  end
    end
    
    fprintf('\n');
    fprintf('The lookback option value at t = 0 for M = %d is = %f \n', M(i), option(i));
    fprintf('\n');
end

end

% main function

  function [Markov] = Markovian(s0,K,T,M,sg,u,d,dt,p,r)
  European_call = zeros(M+1,M+1);
  
  for j = M+1:-1:2
    for i = 1:1:j
      stockprice(i,j) = s0*d^(i-1)*u^(j-i);
    end
  end
  
  for i = M:-1:1
      for j = 1:1:i
          Markov(j,i) = exp(-r*dt)*(p*European_put(j,i+1)+(1-p)*European_put(j+1,i+1));
      end
  end
  end
