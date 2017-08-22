function []=lab_10_part3()
%------------------------------------- vary S0 ------------------------------------------
    mu=0.1;     sigma=0.2;      r=0.05;
    K=105;     del_t=0.01;    T=0.5;
    paths=100;  data_count=100;
    
    S0=[80:0.5:120];
    call = zeros(length(S0), data_count+1);
    put  = zeros(length(S0), data_count+1);
    
    for count=1:length(S0)
        for j=1:data_count
            for i=1:paths
                S=lab_10_gbm(S0(count), r, sigma, del_t, T);
                call(count, j) = call(count, j) + max( ((sum(S)/(T/del_t)) - K), 0);
                put (count, j) = put(count, j)  + max( (K - (sum(S)/(T/del_t))), 0);
            end
            call(count, j) = (call(count, j)/paths)*exp(-r*T);
            put (count, j) = (put(count, j) /paths)*exp(-r*T);
        end
    end

    call(:, data_count+1) = mean(call(:, 1:data_count), 2);
    put (:, data_count+1) = mean(put (:, 1:data_count), 2);
    
    gcf=figure(3);
    plot(S0, call(:, data_count+1));
    xlabel('S0');
    ylabel('Call Option Price');
    title('Call option price v/s S0');
    saveas(gcf, 'Call_S0.png', 'png');
        
    gcf=figure(4);
    plot(S0, put(:, data_count+1));
    xlabel('S0');
    ylabel('Put Option Price');
    title('Put option price v/s S0');
    saveas(gcf, 'Put_S0.png', 'png');
    
%------------------------------------- vary K ------------------------------------------
    mu=0.1;     sigma=0.2;      r=0.05;
    S0=100;     del_t=0.01;    T=0.5;
    paths=100;  data_count=100;
    
    K=[80:0.5:120];
    call = zeros(length(K), data_count+1);
    put  = zeros(length(K), data_count+1);
    
    for count=1:length(K)
        for j=1:data_count
            for i=1:paths
                S=lab_10_gbm(S0, r, sigma, del_t, T);
                call(count, j) = call(count, j) + max( ((sum(S)/(T/del_t)) - K(count)), 0);
                put (count, j) = put(count, j)  + max( (K(count) - (sum(S)/(T/del_t))), 0);
            end
            call(count, j) = (call(count, j)/paths)*exp(-r*T);
            put (count, j) = (put(count, j) /paths)*exp(-r*T);
        end
    end
    call(:, data_count+1) = mean(call(:, 1:data_count), 2);
    put (:, data_count+1) = mean(put (:, 1:data_count), 2);
    
    gcf=figure(5);
    plot(K, call(:, data_count+1));
    xlabel('K');
    ylabel('Call Option Price');
    title('Call option price v/s K');
    saveas(gcf, 'Call_K.png', 'png');
        
    gcf=figure(6);
    plot(K, put(:, data_count+1));
    xlabel('K');
    ylabel('Put Option Price');
    title('Put option price v/s K');
    saveas(gcf, 'Put_K.png', 'png');
    
%------------------------------------- vary r ------------------------------------------
    mu=0.1;     sigma=0.2;      K=105;
    S0=100;     del_t=0.01;     T=0.5;
    paths=100;  data_count=100;
    
    r=[0.01:0.01:0.2];
    call = zeros(length(r), data_count+1);
    put  = zeros(length(r), data_count+1);
    
    for count=1:length(r)
        for j=1:data_count
            for i=1:paths
                S=lab_10_gbm(S0, r(count), sigma, del_t, T);
                call(count, j) = call(count, j) + max( ((sum(S)/(T/del_t)) - K), 0);
                put (count, j) = put(count, j)  + max( (K - (sum(S)/(T/del_t))), 0);
            end
            call(count, j) = (call(count, j)/paths)*exp(-r(count)*T);
            put (count, j) = (put(count, j) /paths)*exp(-r(count)*T);
        end
    end
    call(:, data_count+1) = mean(call(:, 1:data_count), 2);
    put (:, data_count+1) = mean(put (:, 1:data_count), 2);
    
    gcf=figure(7);
    plot(r, call(:, data_count+1));
    xlabel('r');
    ylabel('Call Option Price');
    title('Call option price v/s r');
    saveas(gcf, 'Call_r.png', 'png');
        
    gcf=figure(8);
    plot(r, put(:, data_count+1));
    xlabel('r');
    ylabel('Put Option Price');
    title('Put option price v/s r');
    saveas(gcf, 'Put_r.png', 'png'); 
    
%------------------------------------- vary sigma ------------------------------------------
    mu=0.1;     r=0.05;      K=105;
    S0=100;     del_t=0.01;     T=0.5;
    paths=100;  data_count=100;
    
    sigma=[0.1:0.01:0.3];
    call = zeros(length(sigma), data_count+1);
    put  = zeros(length(sigma), data_count+1);
    
    for count=1:length(sigma)
        for j=1:data_count
            for i=1:paths
                S=lab_10_gbm(S0, r, sigma(count), del_t, T);
                call(count, j) = call(count, j) + max( ((sum(S)/(T/del_t)) - K), 0);
                put (count, j) = put(count, j)  + max( (K - (sum(S)/(T/del_t))), 0);
            end
            call(count, j) = (call(count, j)/paths)*exp(-r*T);
            put (count, j) = (put(count, j) /paths)*exp(-r*T);
        end
    end
    call(:, data_count+1) = mean(call(:, 1:data_count), 2);
    put (:, data_count+1) = mean(put (:, 1:data_count), 2);
    
    gcf=figure(9);
    plot(sigma, call(:, data_count+1));
    xlabel('sigma');
    ylabel('Call Option Price');
    title('Call option price v/s sigma');
    saveas(gcf, 'Call_sigma.png', 'png');
        
    gcf=figure(10);
    plot(sigma, put(:, data_count+1));
    xlabel('sigma');
    ylabel('Put Option Price');
    title('Put option price v/s sigma');
    saveas(gcf, 'Put_sigma.png', 'png');  

end
