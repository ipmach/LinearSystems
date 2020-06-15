%clc;
clear;
clf;

n = 64;
[A,b] = initialize_A_b(n,[1,0;n,0]);

%Create subdomains
N = {};
N_v = {};
list_overlap = [1,2,4,8];
len = int16(n/2);
for i = list_overlap
   N_aux = {};
   N_aux{1} = [1:len+i];
   N_aux{2} = [len+1:n];
   N{i} = N_aux;
   %Create the overloap in the sets
   v_aux = {};
   v_aux{1}= ones(1,len+i);
   v_aux{1}(length(v_aux{1})-i+1:length(v_aux{1})) = ones(1,i) *0.5;
   v_aux{2}= ones(1,n - len);
   v_aux{2}(1:i) = ones(1,i) *0.5;
   N_v{i}= v_aux;
end

color = ["b-o";"r-o";"g-o";"c-o"];
j = 1;
len = length(list_overlap);
%Plot subdomains
step_size = 0.7;
for i = 1:len
    index =2^(i-1);
    fprintf('Number subdomain  %d\n',index);
    x = zeros(n,1); %reset x
    [x,error] = block_jacobi_richardson(A,b,x,N{index},N_v{index},step_size);
    subplot(len,2,j)
    j = j +1;
    plot(x,color(i)); title(sprintf('Prediction %d overlaping',index))
    subplot(len,2,j)
    j = j +1;
    plot(error,color(i)); title(sprintf('norm(x_{old} -x) %d overlaping',index))
    xlabel("interations")
end