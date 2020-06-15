function [x,error] = block_jacobi_richardson(A,b,x,N,N_v,step_size)
    n = length(b);
    %Create A compact
    G = zeros(n);
     for i = 1:length(N)
         R = restriction(N{i},N_v{i},n);
         G = G + R'*inv(R*A*R')*R;
     end
    G = sparse(G);
    error = [];
    max_iter = 5000; %Max number of iterations allow
    i = 1;
    %Apply Richardson
    x_old = ones(1,length(x));
    while norm(x-x_old) > 1e-6 && max_iter > i
        r = calculateResidual(A,b,x);
        x_old = x;
        x = x + step_size*G * r;
        i = i+1;
        error = [error,norm(x-x_old)];
    end

end