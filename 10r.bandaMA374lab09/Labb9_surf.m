clear all;
format long;



option = xlsread('nifty.xlsx','Sheet1');
strike = xlsread('nifty.xlsx','Sheet2');
maturity = xlsread('nifty.xlsx','Sheet3');

maturity

surf(maturity,strike,option)