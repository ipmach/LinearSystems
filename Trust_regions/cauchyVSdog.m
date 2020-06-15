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

ini = [[0;-1],[3;-3],[0;-5]];

for j = [1: length(ini)]
    figure(j)
    %Trust region method
    [X_,R,Xm] = trustRegion(funct,m,g,B,0.75,ini(:,j),0.2,-1);
    subplot(3,2,1)
    draw(X_,R,funct,'cauchy point')

    [X_2,R2,Xm2] = trustRegion(funct,m,g,B,0.75,ini(:,j),0.25,1);
    subplot(3,2,2)
    draw(X_2,R2,funct,'dog leg')

    %Plot radius
    subplot(3,2,[3,4])
    plot(R,'-o'); 
    hold on;
    plot(R2,'-o');
    legend('cauchy point', 'dog leg')
    title('Radius size');xlabel('iterations');ylabel('size')

    %Plot Function f
    subplot(3,2,5)
    f_list = zeros(1,length(X_));
    f_list2 = zeros(1,length(X_2));
    for i = [1: length(X_)]
        f_list(i) = funct(X_(i,1),X_(i,2));
        f_list2(i) = funct(X_2(i,1),X_2(i,2));
    end
    plot(f_list,'-o');hold on; plot(f_list2,'-o')
    legend('cauchy point', 'dog leg')
    title('Function f(x) ');xlabel('iterations');ylabel('value')

    % Plot trust region x
    subplot(3,2,6)
    plot(Xm,'-o');hold on; plot(Xm2,'-o')
    legend('cauchy point', 'dog leg')
    title('Performance ratio');xlabel('iterations');ylabel('value')

    sgtitle(sprintf('Initial point [%.2f, %.2f]',[ini(1,j),ini(2,j)]))
end

    



