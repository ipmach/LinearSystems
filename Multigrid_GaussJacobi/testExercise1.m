% Example taken from slides of tutorials 9 & 10 (slide 4)
A = [1, 1,0; 
    0, 1,1; 
    1, 2,1;
    1,0,1];
b = [2; 2; 3;4];

% From that example:
%   x* is [14/5; 21/10]
%   residual is [-0.5; 0; 0.5]
%   euclidean norm is sqrt(2)/2
%   SE is 0.5
%   RMSE is sqrt(1/6) (0.408)

[x_star, residual_norm, SE, RMSE] = leastSquares(A, b)

