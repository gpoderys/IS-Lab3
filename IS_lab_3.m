close all
clear 
clc

%Duomenų paruošimas
x =[0:1/22:1];
d = ((1 + 0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x)))/2;
figure(1), plot(x,d), grid on;

c1 = 0.2;
c2 = 0.9;
r1 = 0.1;
r2 = 0.1;
