function [I,m] = interpolation_matrix(n)
    m = 2*(n-1) +1;
    I = sparse(zeros(m,n));
    j = 0;
    for i = 1:m
       if mod(i,2) == 0
          I(i,i-j) = 1/2;
          I(i,i-j+1) = 1/2;
       else
           j = j+1;
           I(i,j) = 1;
       end
    end
end

