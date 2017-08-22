
clear all;

[num] = xlsread('NSEoptiondata.xlsx','29 Dec 11 put');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 41/12;
end

plot3(strike,settle,maturity)
%plot(maturity,settle)

xlabel('Maturity Price')
ylabel('Put Price')
zlabel('Maturity')
hold all;

clear all;

[num] = xlsread('NSEoptiondata.xlsx','30 Jun 11 put');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 35/12;
end

plot3(strike,settle,maturity)
%plot(maturity,settle)

clear all;

[num] = xlsread('NSEoptiondata.xlsx','30 Dec 10 put');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 29/12;
end

plot3(strike,settle,maturity)
%plot(maturity,settle)

clear all;

[num] = xlsread('NSEoptiondata.xlsx','24 Jun 10 put');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 23/12;
end

plot3(strike,settle,maturity)
%plot(maturity,settle)

clear all;


[num] = xlsread('NSEoptiondata.xlsx','31 Dec 09 put');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 17/12;
end


plot3(strike,settle,maturity)
%plot(maturity,settle)

clear all;

[num] = xlsread('NSEoptiondata.xlsx','25 Jun 09 put');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 11/12;
end


plot3(strike,settle,maturity)
%plot(maturity,settle)


clear all;

[num] = xlsread('NSEoptiondata.xlsx','26 Mar 09 put');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 8/12;
end

plot3(strike,settle,maturity)
%plot(maturity,settle)


clear all;

[num] = xlsread('NSEoptiondata.xlsx','25 Dec 08 put');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 5/12;
end

plot3(strike,settle,maturity)
%plot(maturity,settle)

clear all;

[num] = xlsread('NSEoptiondata.xlsx','25 Sep 08 put');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 2/12;
end

plot3(strike,settle,maturity)
%plot(maturity,settle)


clear all;

[num] = xlsread('NSEoptiondata.xlsx','28 Aug 08 put');
[c r] = size(num);

strike(:,1) = num(:,1);
settle(:,1) = num(:,3);
for i = 1:c
    maturity(i,1) = 1/12;
end


plot3(strike,settle,maturity)
%plot(maturity,settle)
