clc;
clear; 
timeG =[];
timeJ = [];
tolerance = 1e-5;
j = 1
for n = [10,20,40,60,80] 
     j = j + 1 ;
    figure(j)
    sgtitle('Size ' + string(n))
    disp(n)
    %Initializing problem parameters
    grid = createGrid(n);
    [A,b] = initialize_A_b(n,[1,0;n,0]);
    u = rand(n,1);

    %Applying jaccobi
    tic;
    [u_j,residual_2_jaccobi,residual_m_jaccobi,residual_e_jaccobi,rest_jaccobi] = jaccobi(A,b,u,n,tolerance);
    timeJ = [timeJ,toc];
    error_jaccobi = calculateError(rest_jaccobi);
    error_e_jaccobi = [];
    ne = size(error_jaccobi);
    for i =1:ne(2)
        error_e_jaccobi = [error_e_jaccobi,energyNorn(A,error_jaccobi(:,i))];
    end
    %Applying gauss seidel
    tic;
    [u_g,residual_2_gaussSeidel,residual_m_gaussSeidel,residual_e_gaussSeidel,rest_gaussSeidel] = gaussSeidel(A,b,u,n,tolerance);
    timeG = [timeG,toc];
    error_gaussSeidel = calculateError(rest_gaussSeidel);
    error_e_gaussSeidel = [];
    ne = size(error_gaussSeidel);
    for i =1:ne(2)
        error_e_gaussSeidel = [error_e_gaussSeidel,energyNorn(A,error_gaussSeidel(:,i))];
    end

    %Plot Jaccobi solution
    subplot(4,4,[1,2])
    plot(grid,zeros(1,n),'x')
    hold on; 
    plot(grid,u_j,'-o')
    legend('grid','jaccobi')
    title('Jaccobi solve equation')

    %Plot Gauss Seidel solution
    subplot(4,4,[3,4])
    plot(grid,zeros(1,n),'x')
    hold on; 
    plot(grid,u_g,'-o')
    legend('grid','gauss')
    title('Gauss Seidel solve equation')

    %Plot Jaccobi residual euclidian norn
    subplot(4,4,5)
    loglog(residual_2_jaccobi,'r-o')
    legend('residual euclidan norm')
    title('Jaccobi residual euclidan norm logarithm')

    %Plot Gauss Seidel residual euclidian norn
    subplot(4,4,6)
    loglog(residual_2_gaussSeidel,'r-o')
    legend('residual euclidan norm')
    title('Gauss residual euclidan norm logarithm')

    %Plot Jaccobi error euclidian norn
    subplot(4,4,7)
    loglog(vecnorm(error_jaccobi),'r-o')
    legend('error euclidan norm')
    title('Jaccobi error euclidan norm logarithm')

    %Plot Gauss Seidel error euclidian norn
    subplot(4,4,8)
    loglog(vecnorm(error_gaussSeidel),'r-o')
    legend('error euclidan norm')
    title('Gauss error euclidan norm logarithm')

    %Plot Jaccobi residual maximun norn
    subplot(4,4,9)
    loglog(residual_m_jaccobi,'c-o')
    legend('residual maximun norm')
    title('Jaccobi residual maximun norm')

    %Plot Gauss Seidel residual maximun norn
    subplot(4,4,10)
    loglog(residual_m_gaussSeidel,'c-o')
    legend('residual maximun norm')
    title('Gauss residual maximun norm')

    %Plot Jaccobi error maximun norn
    subplot(4,4,11)
    loglog(max(error_jaccobi,[],1),'c-o')
    legend('error maximun norm')
    title('Jaccobi residual maximun norm')

    %Plot Gauss Seidel error maximun norn
    subplot(4,4,12)
    loglog(max(error_gaussSeidel,[],1),'c-o')
    legend('error maximun norm')
    title('Gauss residual maximun norm')

    %Plot Jaccobi residual energy norn
    subplot(4,4,13)
    loglog(residual_e_jaccobi,'k-o')
    legend('residual energy norm')
    title('Jaccobi residual energy norm')

    %Plot Gauss Seidel residual energy norn
    subplot(4,4,14)
    loglog(residual_e_gaussSeidel,'k-o')
    legend('residual energy norm')
    title('Gauss residual energy norm')

    %Plot Jaccobi error energy norn
    subplot(4,4,15)
    loglog(error_e_jaccobi,'k-o')
    legend('error energy norm')
    title('Jaccobi error energy norm')


    %Plot Jaccobi error energy norn
    subplot(4,4,16)
    loglog(error_e_gaussSeidel,'k-o')
    legend('error energy norm')
    title('Gauss error energy norm')

end
figure(1)
plot([10,20,40,60,80],timeJ,'-o')
hold on;
plot([10,20,40,60,80],timeG,'-o')
legend('time Jacobi', 'time Gauss Seidel')
title('time vs size')
xlabel('size system')
ylabel('time')