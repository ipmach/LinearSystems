function [u,pre,pos] = twoLevelMethod(u,A_h,b,n)
    %%%%GOING DOWN%%%%
    %%%% Step 1 - level 1 %Smoother
    for i = 1:3
        u =jaccobi_noIteration(A_h,b,u,n);
    end
    %%%% Step 2 - level 1 %residual
    r = calculateResidual(A_h,b,u);
    %%%% Step 3 - level 1 %restriction
    [r,n] = restriction(r);
    %%%%%%%%%%%%%%%%
    
    %%%% Step 4
     A_2h = restriction(A_h) * interpolation_matrix(n);
     e = A_2h\r;
    %%%%%%%%%%%%%%%%
    
    %%%%%GOING UP
    %%%% Step 5 - level 2
    [e,n] = interpolation(e);

    %%%% Step 6 - level 2
    u = e + u;

    %%%% Step 7 - level 2
    for i = 1:3
        u =jaccobi_noIteration(A_h,b,u,n);
    end
    %%%%%%%%%%%%%%%%
    
end

