clear all;
% close all;
clc;
%==============================
% functions
%==============================

f = @(x,y) power(power(x,2) + y - 11,2) + power(x + power(y,2) - 7,2); %Himmelblau's function

%==============================
% init grid and variables
%==============================
nx = 40;

xmin = -5;
xmax = +5;

[X,Y] = meshgrid(linspace(xmin,xmax,nx),linspace(xmin,xmax,nx));
Z = f(X,Y);
N = 40; %number iterations
x= [4; 2]; %initial value

%List to save stadistics
determinant = zeros(N,1);
point = zeros(N,3);
eignvalues= zeros(N,2);

stepSize = 0.7; %step sizs

%Define jacobian array and hessian matrixs
syms x_i y_i;

%==============================
% init jacobian and hessian matrixs
%==============================

jacobian_matrix = jacobian(power(power(y_i,2) + x_i - 7,2) + power(power(x_i,2) + y_i -11,2), [x_i;y_i]);
jacobian_matrix_v = matlabFunction(jacobian_matrix);

hessian_matrix = hessian(power(power(y_i,2) + x_i - 7,2) + power(power(x_i,2) + y_i -11,2), [x_i;y_i]);
hessian_matrix_v = matlabFunction(hessian_matrix);

%==============================
% method's operations
%==============================
for i = 1:N;
  %saving the points
  point(i,:) = [x(1),x(2),f(x(1),x(2))];
  %Newton's method
  hessian_m  = hessian_matrix_v(x(1),x(2));
  jacobian_m = transpose(jacobian_matrix_v(x(1),x(2)));
  x =  x - stepSize * inv(hessian_m) * jacobian_m

  %saving the stadistics
  determinant(i) = det(hessian_m);
  gradient(i) = norm(jacobian_m);
  eignvalues(i,:) = transpose(eig(hessian_m));
end

%==============================
% plot
%==============================
%First plot
subplot(2,2,1);
plot(point(:,1),point(:,2),'r-o');hold on;
contour(X,Y,Z,40);title('Contour map');
%Second plot
subplot(2,2,2);
plot3(point(:,1),point(:,2),point(:,3),'r-o');hold on;
mesh(X,Y,Z);title('3D grid');
%Rest plots
subplot(2,3,4);plot(gradient,'-o');title('gradient norn');
subplot(2,3,5);plot(determinant,'-o');title('hessian determinant');
subplot(2,3,6); plot(eignvalues(:,1),'b-o'); hold on; plot(eignvalues(:,2),'r-o');title('hessian eignvalues');
