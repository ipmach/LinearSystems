%clc;
clear;
clf;

n = 64;
[A,b] = initialize_A_b(n,[1,0;n,0]);

%Create subdomains
N = {};
N_v = {}; %value in R (1 if not overlapping)
list_subdomains = [1,2,4,8];
for i = list_subdomains
    size_N = int16(n/i);
    aux_N = {};
    aux_v = {};
    aux_n = n;
    for j = 1:i
        aux_N{j} = [size_N*(j-1) + 1 : size_N*j];
        aux_v{j} = ones(1,length(aux_N{j}));
    end
    N{i} = aux_N;
    N_v{i} = aux_v;
end

color = ["b-o";"r-o";"g-o";"c-o"];
j = 1;
len = length(list_subdomains);
%Plot subdomains
step_size = 1;
for i = 1:len
    index =2^(i-1);
    fprintf('Number subdomain  %d\n',index);
    x = zeros(n,1);
    [x,error] = block_jacobi_richardson(A,b,x,N{index},N_v{index},step_size);
    subplot(len,2,j)
    j = j +1;
    plot(x,color(i)); title(sprintf('Prediction %d subdomanins',index))
    subplot(len,2,j)
    j = j +1;
    plot(error,color(i)); title(sprintf('norm(x_{old} -x) %d subdomanins',index))
    xlabel("interations")
end