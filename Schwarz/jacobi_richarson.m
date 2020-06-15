function [x,residual_list] = jacobi_richarson(A,b,x)
    r = calculateResidual(A,b,x);
    residual_list = [norm(r)];
    D = inv(A .* eye(length(r))); %Diagonal of A
    while norm(r) > 1e-5
        x = x + D * r;
        r = calculateResidual(A,b,x);
        residual_list = [residual_list,norm(r)];
    end
end