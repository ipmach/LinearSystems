function [u,residual_euclidian,residual_max,residual_energy,rest_u] = gaussSeidel(A,b,u,n,tolerance)
    %Gauss Seidel iterative method 
    residual_euclidian = [];
    residual_max = [];
    residual_energy = [];
    rest_u = [];
    while norm(calculateResidual(A,b,u) )> tolerance
        u = gaussSeidel_noIteration(A,b,u,n);
        residual_euclidian = [residual_euclidian,norm(calculateResidual(A,b,u))];
        residual_max = [residual_max,max(calculateResidual(A,b,u))];
        residual_energy = [residual_energy, energyNorn(A,u)];
        rest_u = [rest_u,u];
    end
   
end