function [u,m] = interpolation(v)
    z = size(v);
    n = z(1);
    [I,m] = interpolation_matrix(n);
    u = I * v;
end

