function [A,b] = addBoundaries(A,boundaries,n,b)
    %Add boundaries to matrix A
    num = size(boundaries);
    for i = 1: num(1)
        A(boundaries(i,1),:) = zeros(1,n);
        A(boundaries(i,1),boundaries(i,1)) = 1;
        b(boundaries(i,1)) = boundaries(i,2);
        %Keep matrix A symmetric
        if boundaries(i,1) > 1 %applying gaussian line top
             b(boundaries(i,1)-1) = b(boundaries(i,1)-1) - b(boundaries(i,1)) * A(boundaries(i,1)-1,boundaries(i,1));
             A(boundaries(i,1)-1,boundaries(i,1)) = 0;
        end
        if boundaries(i,1) <n  %applying gaussian line bottom
             b(boundaries(i,1)+1) = b(boundaries(i,1)+1)- b(boundaries(i,1)) * A(boundaries(i,1)+1,boundaries(i,1));
             A(boundaries(i,1)+1,boundaries(i,1)) = 0;
        end
    end
end
