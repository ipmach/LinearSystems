function error = calculateError(u)
    %calculate the error
    s = size(u);
    solution = u(s(1));
    error = solution - u;
end

