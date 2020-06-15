%clc;
clear;

n = 64;
[A,b] = initialize_A_b(n,[1,0;n,0]);
 x = zeros(n,1);

step_size = 10e-5;
[x,residual_list] = richarson(A,b,x,step_size);
subplot(2,2,1)
plot(x,'b-o'); title('prediction richardson')
subplot(2,2,2)
plot(residual_list,'b-o'); title('Residual norm richardson')
xlabel("interations")

 x = zeros(n,1);
[x,residual_list] = jacobi_richarson(A,b,x);
subplot(2,2,3)
plot(x,'r-o'); title('prediction jacobi-richardson')
subplot(2,2,4)
plot(residual_list,'r-o'); title('Residual norm jacobi-richardson')
xlabel("interations")

