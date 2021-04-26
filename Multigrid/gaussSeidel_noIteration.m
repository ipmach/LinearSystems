function u = gaussSeidel_noIteration(A,b,u,n)
    %Operate jaccobi for one iteration
    old_u = u;
    for i = 1:n
       aux = 0;
       for j = 1:i-1
             aux = aux + A(i,j) * u(j); 
       end
       for j = i+1:n
             aux = aux + A(i,j) * old_u(j); 
       end
       u(i) = (1/A(i,i)) * (b(i) - aux);
    end
end
