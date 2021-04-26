function [v,n] = restriction(u)
    z = size(u);
    z = round((z(1) -1)/2);
    n = z+1;
    R = interpolation_matrix(n).';
    v = R * u;
end
