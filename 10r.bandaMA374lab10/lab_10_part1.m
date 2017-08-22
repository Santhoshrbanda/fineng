function []=lab_10_part1()

    mu=0.1;     sigma=0.2;      r=0.05;
    S0=100;     del_t=0.001;    T=1;
    paths=10;
    
    for i=1:paths
        col=hsv(10);
        S=lab_10_gbm(S0, mu, sigma, del_t, T);
        gcf=figure(1);
        plot(0.001:del_t:1, S, 'color', col(i,:));
        hold on;
    end
    xlabel('stock price');
    ylabel('Time');
    title('Stock Price(following GBM) v/s Time, under Real World');
    hold off;
    saveas(gcf, 'stock_time_real', 'jpeg');
    
    for i=1:paths
    col=hsv(10);
    S=lab_10_gbm(S0, r, sigma, del_t, T);
    gcf=figure(2);
    plot(0.001:del_t:1, S, 'color', col(i,:));
    hold on;
    end
    xlabel('stock price');
    ylabel('Time');
    title('Stock Price(following GBM) v/s Time, under Risk-Neutral World');
    saveas(gcf, 'Stock_time_risk_neutral', 'jpeg');
    hold off;
end
