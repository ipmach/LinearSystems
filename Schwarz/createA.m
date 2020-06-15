function A = createA(n) 
    %create A with no boundaries
    A = zeros(n);
    n2 = (n-1)^2; % n^2
    n2d2 = n2*2; %n^2*2
    %First line
    A(1,1) = n2d2;
    A(1,2) = -n2;
    %Midle line
    for i = 2:n-1
        A(i,i-1) = -n2;
        A(i,i) = n2d2;
        A(i,i+1) = -n2;
    end
    %Last line
    A(n,n-1) = -n2;
    A(n,n) = n2d2;
end
