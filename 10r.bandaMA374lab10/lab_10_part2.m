function []=lab_10_part2()

    mu=0.1;     sigma=0.2;      r=0.05;
    S0=100;     del_t=0.001;    T=0.5;
    paths=100;  data_count=1000;
    
    K=[90, 105, 110];
    for count=1:length(K)   
        call = zeros(1, data_count);
        put  = zeros(1, data_count);

        for j=1:data_count
            for i=1:paths
                S=lab_10_gbm(S0, r, sigma, del_t, T);
                call(j) = call(j) + max( ((sum(S)/(T/del_t)) - K(count)), 0);
                put (j) = put(j)  + max( (K(count) - (sum(S)/(T/del_t))), 0);
            end
            call(j) = (call(j)/paths)*exp(-r*T);
            put (j) = (put(j) /paths)*exp(-r*T);
        end

        fprintf('\nConfidence interval for call option with strike=%d:\t(%6.6f  %6.6f)\t with mean=%f\n', K(count), mean(call) - 1.96*sqrt(var(call)/data_count), mean(call) + 1.96*sqrt(var(call)/data_count), mean(call));
        fprintf('Confidence interval for put  option with strike=%d:\t(%6.6f  %6.6f)\t with mean=%f\n', K(count), mean(put) - 1.96*sqrt(var(put)/data_count), mean(put) + 1.96*sqrt(var(put)/data_count), mean(put));
    end
end
