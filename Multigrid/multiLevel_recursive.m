function u = multiLevel_recursive(u,A_h,b,n,levels)
    if levels == 0
         %%%% Step 4
         u = A_h\b;
        %%%%%%%%%%%%%%%%
    else
        %%%%GOING DOWN%%%%
        %%%% Step 1 - level 1 %Smoother
        for i = 1:3
            u =jaccobi_noIteration(A_h,b,u,n);
        end
        %%%% Step 2 - level 1 %residual
        r = calculateResidual(A_h,b,u);
        %%%% Step 3 - level 1 %restriction
        [r,n_2h] = restriction(r);
        %%%%%%%%%%%%%%%%
        A_2h = restriction(A_h) * interpolation_matrix(n_2h);
        e = multiLevel_recursive(zeros(n_2h,1),A_2h,r,n_2h,levels-1);
        %%%%%GOING UP
        %%%% Step 5 - level 2
        e = interpolation(e);

        %%%% Step 6 - level 2
        u = e + u;

        %%%% Step 7 - level 2
        for i = 1:3
            u =jaccobi_noIteration(A_h,b,u,n);
        end
        %%%%%%%%%%%%%%%%
    end
end