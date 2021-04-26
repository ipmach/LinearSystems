clc;
clear;

%This file is to plot everything together

%Load data
load('data.mat')

%Exercise number 2
x_2_a = leastSquares(A(:,[1,2]), b); % Part a
x_2_b = leastSquares(A(:,[1,2,3]), b); % Part b
x_2_c = leastSquares(A, b); % Part c

%Predictions exercise 2
y_predicted_2_a = A(:,[1,2])* x_2_a;
y_predicted_2_b = A(:,[1,2,3])* x_2_b;
y_predicted_2_c = A * x_2_c;

%Exercise number 3
x_3_a = leastSquares(A_2(:,[1,2,3]), b_2); % Part a
x_3_b = leastSquares(A_2(:,[1,2,3,4]), b_2); % Part b

%Predictions exercise 3
y_predicted_a = A_2(:,[1,2,3]) * x_3_a;
y_predicted_b = A_2(:,[1,2,3,4]) * x_3_b;


% Plotting dataset and linear model 
x = 1980:2014 ;
y = b;



figure(1)
plot(x, y, 'ro', x, y_predicted_2_a, 'b-', x,y_predicted_2_b,'m-',x,y_predicted_2_c,'c-');
legend('Raw points','Prediction a', 'Prediction b','Prediction c')
title('Exercise 2')
xlabel('years')
ylabel('production')

x = 1:length(b_2) -1;
y = b_2;

y(end) = [];
y_predicted_a(end) =[];
y_predicted_b(end) =[];

figure(2)
plot(x, y, 'ro', x, y_predicted_a ,'b-', x,y_predicted_b,'m-');
legend('Raw points','Prediction a', 'Prediction b')
title('Exercise 3')
xlabel('months')
ylabel('temperature')


