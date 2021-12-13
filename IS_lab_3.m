close all
clear 
clc

%Duomenų paruošimas
x =[0:1/22:1];
d = ((1 + 0.6*sin(2*pi*x/0.7))+(0.3*sin(2*pi*x)))/2;
figure(1), plot(x,d), grid on;

c1 = 0.18;
c2 = 0.92;
r1 = 0.25;
r2 = 0.21;

w1 = rand(1);
w2 = rand(1);
b = rand(1);
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

%Aproksimatoriaus testavimas
X = [0:1/22:1];

Y = zeros(1, length(X));
for index=1:length(X)
    F1=exp(-(((X(index)-c1)^2)/(2*r1^2)));
    F2=exp(-(((X(index)-c2)^2)/(2*r2^2)));
    y=F1*w1+F2*w2+b;
    Y(index)=y;
end
hold on , plot(X,Y,'r+'), hold off
