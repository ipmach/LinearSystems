function b = createB(grid,n)
    %create b array
    b = zeros(n,1);
    for i = 1:n
       b(i) = sin(2*pi*grid(i));
    end
end