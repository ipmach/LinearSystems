clc;
clear;

%Load data
load('data.mat')

A = A_2;
b = b_2;
A =  A(:,[1,2,3]);

clear A_2;
clear b_2;

% Fitting the linear model (a_1 + a_2 * x = y)
[x_star, residual, SE, RMSE] = leastSquares(A, b);

% Displaying result of fitted model
disp("Found solution for x*");
disp(x_star);

disp("Norm of the residual");
disp(residual);

disp("SE");
disp(SE);

disp("RMSE");
disp(RMSE);

% Plotting just the dataset (for report)
x = 1:length(b);
y = b;

% Plotting dataset and linear model 
y_predicted = A * x_star;
plot(x, y, 'ro', x, y_predicted, 'k-')