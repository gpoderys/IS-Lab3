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

w1 = rand(1)
w2 = rand(1)
b = rand(1)
lr= 0.1;

%Aproksimatoriaus apmokymas
for i = 1:10000
    for index = 1:length(x)
        F1 = exp(-(((x(index)-c1)^2)/(2*r1^2)));
        F2 = exp(-(((x(index)-c2)^2)/(2*r2^2)));
        y = F1*w1 + F2*w2 + b;
        e = d(index) - y;

        w1 = w1 + lr*e*F1;
        w2 = w2 + lr*e*F2;
        b = b + lr*e;
    end
end