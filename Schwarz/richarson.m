function [x,residual_list] = richarson(A,b,x,step_size)
    r = calculateResidual(A,b,x);
    residual_list = [norm(r)];
    while norm(r) > 1e-5
        x = x + step_size * r;
        r = calculateResidual(A,b,x);
        residual_list = [residual_list,norm(r)];
    end
end