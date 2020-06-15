function [x,residual_list] = schwarz_richardson(A,b,x,N,N_v)
    n = length(b);
    %Create A compact
    G = zeros(n);
     for i = 1:length(N)
         R = restriction(N{i},N_v{i},n);
         G = G + R'*inv(R*A*R')*R;
     end

    r = calculateResidual(A,b,x);
    residual_list = [norm(r)];
    
    %Apply Richardson
    while norm(r) > 1e-5
        x = x + G * r;
        r = calculateResidual(A,b,x);
        residual_list = [residual_list,norm(r)];
    end

end