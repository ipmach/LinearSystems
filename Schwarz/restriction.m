function R = restriction(N,N_v,n)
    len = length(N);
    R = zeros(len,n);
    for i = 1:len
        R(i,N(i)) = N_v(i);
    end
end