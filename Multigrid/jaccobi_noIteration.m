function u = jaccobi_noIteration(A,b,u,n)
    %Operate jaccobi for one iteration
    for i = 1:n
       aux = 0;
       for j = 1:n
          if j ~= i
             aux = aux + A(i,j) * u(j); 
          end
       end
       u(i) = (1/A(i,i)) * (b(i) - aux);
    end
end

