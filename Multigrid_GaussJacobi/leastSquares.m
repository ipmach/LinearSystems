function [leastSqrs, residualNorm, SE, RMSE] = leastSquares(A, b)
    % Function use to calculate x in the linear system Ax = b
    % we do a conversion to make sure that A shape is nxn 
    % operations:
    %   A^t * A * x = A^t * b
    %   x = (A^t * A)^(-1) * A^t * b
    
    s = size(A);
    
    if s(2) == rank(A)
        A_t = transpose(A); %Calcuating A transpose
        leastSqrs = A_t * A \ A_t * b; % Solving linear system
    else % Rank deficient
        errID = 'myComponent:inputError';
        msgtext = 'Rank matrix A deficient.';
        ME = MException(errID,msgtext);
        throw(ME)
    end
    
    residualNorm = norm(b -  A * leastSqrs); % Calculation of the residual norm 
    SE = residualNorm * residualNorm; % Calculation of the square error
    RMSE = residualNorm / sqrt(length(A)); % Calculation of the mean square error
end