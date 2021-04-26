clear;
clc;
tolerance = 1e-5;
time_level = [];
level_vec= 1:2;
size_n = [8];
for level = level_vec
    disp('level: '+ string(level))
    time = [];
    for p = size_n
        n = (2^p)+1; %numbers of point in the Grid
        disp(' size: '+ string(n))
        u = rand(n,1);
        j = 0;
        [A,b] = initialize_A_b(n,[1,0;n,0]);
        norn_e_l = [];
        error_l = [];
        norn_m_l = [];
        norm_energy = [];
        error_e = [];
        tic;
        %Solving

        while norm(calculateResidual(A,b,u) )> tolerance 
            %u = twoLevelMethod(u,A,b,n);  %Disconnect to run two level method
            u = multiLevel_recursive(u,A,b,n,level);
            norn_e_l = [norn_e_l;norm(calculateResidual(A,b,u) )];
            norn_m_l = [norn_m_l;max(calculateResidual(A,b,u) )];
            norm_energy = [norm_energy, energyNorn(A,u)];
            error_l = [error_l,u];
        end
        time = [time,toc];
        ne = size(error_l);
        for i =1:ne(2)
            error_e = [error_e,energyNorn(A,error_l(:,i))];
        end
        figure(n)
        subplot(4,2,[1,2])
        plot(createGrid(n),zeros(n,1),'-o')
        hold on;
        plot(createGrid(n),u,'-o')
        legend('grid','Solution')
        title('Multilevel solve equation (n=' + string(n)+ ' levels = '+string(level) +')' )
        subplot(4,2,3)
        loglog(norn_e_l,'r-o')
        legend('residual euclidan norm')
        title('norn euclidian residual')
        subplot(4,2,4)
        plot(vecnorm(calculateError(error_l)),'r-o')
        legend('error euclidan norm')
        title('norn euclidian error')
        %Plot Gauss Seidel error maximun norn
        subplot(4,2,5)
        loglog(norn_m_l,'c-o')
        legend('residual max norm')
        title('norn max residual')
        subplot(4,2,6)
        loglog(max(error_l,[],1),'c-o')
        legend('error max norm')
        title('norn max error')
        %Plot error energy norn
        subplot(4,2,7)
        loglog(norm_energy,'k-o')
        legend('residual energy norm')
        title('residual energy norm')
        %Plot error energy norn
        subplot(4,2,8)
        loglog(error_e,'k-o')
        legend('error energy norm')
        title('error energy norm')

    end
    time_level = [time_level;time];
end

%Plot the times
string_list = {}
figure(1)
for i = level_vec
    plot((2.^size_n) +1,time_level(i,:),'-o')
    hold on;
    string_list{i} =  num2str(i,'Level=%-d');
end
legend(string_list);
title('time vs size')
xlabel('size system')
ylabel('time')

