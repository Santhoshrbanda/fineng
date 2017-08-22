function [call, put] = q1(stockprice, strikeprice, T, t, r, sg)
format short;
dp = 1/(sg*sqrt(T-t))*(log(stockprice/strikeprice)+(r+0.5*sg*sg)*(T-t));
dn = 1/(sg*sqrt(T-t))*(log(stockprice/strikeprice)+(r-0.5*sg*sg)*(T-t));
call = (stockprice*normcdf(dp))-(strikeprice*exp(-r*(T-t))*normcdf(dn));
put = (strikeprice*exp(-r*(T-t))*normcdf(-dn))-(stockprice*normcdf(-dp));
end
