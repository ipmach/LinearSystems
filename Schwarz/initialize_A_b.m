function [A,b] = initialize_A_b(n,bounds)
    %Initialize A and b with bounds
    grid = createGrid(n);
    b = createB(grid,n);
    A = createA(n);
    [A,b] = addBoundaries(A,bounds,n,b);
    A = sparse(A);

end

