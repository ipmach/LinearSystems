function [u,residual_euclidian,residual_max,residual_energy,rest_u] = jaccobi(A,b,u,n,tolerance)
    %Jaccobian iterative method 
    residual_euclidian = [];
    residual_max = [];
    residual_energy = [];
    rest_u = [];
    while norm(calculateResidual(A,b,u) )> tolerance
        u = jaccobi_noIteration(A,b,u,n);
        residual_euclidian = [residual_euclidian,norm(calculateResidual(A,b,u))];
        residual_max = [residual_max,max(calculateResidual(A,b,u))];
        residual_energy = [residual_energy, energyNorn(A,u)];
        rest_u = [rest_u,u];
    end
   
end