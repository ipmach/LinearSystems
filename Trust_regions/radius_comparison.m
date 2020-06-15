clear;
clc;
clf;

%Original function
syms x y
funct = @(x,y)(1-x)^2 + 100*(y-x^2)^2;
%funct = @(x,y)  (x-y)^2 + (y-x^2)^2; 
g= matlabFunction(jacobian(funct,[x,y])');
B= matlabFunction(hessian(funct,[x,y]));

%Tailor series
%f = @(x,p) funct(x(1),x(2)) + g(x(1),x(2))' * p + 0.5 * p' * B(x(1)+0.5*p(1),x(2)+1*p(2))*p;
m = @(x,p) funct(x(1),x(2)) + g(x(1),x(2))' * p + 0.5 * p' * B(x(1),x(2))*p;


ini = [4;-4];
radius = [0.25,0.75,1];
tau = 0.5;
%Trust region method
str1 = sprintf('Radius %.2f',radius(1));
[X_1,R1,Xm1] = trustRegion(funct,m,g,B,radius(1),ini,0.1,tau);
subplot(2,3,1)
draw(X_1,R1,funct,str1)
str2 = sprintf('Radius %.2f',radius(2));
[X_2,R2,Xm2] = trustRegion(funct,m,g,B,radius(2),ini,0.1,tau);
subplot(2,3,2)
draw(X_2,R2,funct,str2)
str3 = sprintf('Radius %.2f',radius(3));
[X_3,R3,Xm3] = trustRegion(funct,m,g,B,radius(3),ini,0.1,tau);
subplot(2,3,3)
draw(X_3,R3,funct,str3)

%Plot radius
subplot(2,3,4)
plot(R1,'-o'); hold on;
plot(R2,'-o');hold on;
plot(R3,'-o');
legend(str1,str2,str3)
title('Radius size');xlabel('iterations');ylabel('size')

%Plot Function f
subplot(2,3,5)
f_list = zeros(1,length(X_1));
f_list2 = zeros(1,length(X_2));
f_list3 = zeros(1,length(X_3));
for i = [1: length(X_1)]
    f_list(i) = funct(X_1(i,1),X_1(i,2));
    f_list2(i) = funct(X_2(i,1),X_2(i,2));
    f_list3(i) = funct(X_3(i,1),X_3(i,2));
end
plot(f_list,'-o');hold on; plot(f_list2,'-o')
hold on; plot(f_list3,'-o')
legend(str1,str2,str3)
title('Function f(x) ');xlabel('iterations');ylabel('value')

% Plot trust region x
subplot(2,3,6)
plot(Xm1,'-o');hold on; plot(Xm2,'-o');hold on; plot(Xm3,'-o')
legend(str1,str2,str3)
title('Performance ratio ');xlabel('iterations');ylabel('value')
