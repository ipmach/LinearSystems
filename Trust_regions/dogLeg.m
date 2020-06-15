function p = dogLeg(g,B,r,x,y,tau)
    g_v= g(x,y); %Jacobian vector
    g_n = norm(g(x,y)); %Jacobian norm
    aux = g_v' * B(x,y) * g_v; % gT*B*g
    if aux <= 0
        tau = 1;
    else
        tau = min((g_n^3)/(r*aux),1);
    end
    tau
    if tau > 2 %tau has to be small than 2
        errID = 'myComponent:inputError';
        msgtext = 'Tau has to between [0,2]';
        ME = MException(errID,msgtext);
        throw(ME)
    else
        g_v= g(x,y); %Jacobian vector
        pu = - ((g_v' * g_v)/(g_v' * B(x,y) * g_v))*g_v;
        if (0 <= tau) && (tau <= 1)
            p = tau * pu;
        else
            pb = -r * g_v/norm(g_v);
            p = pu + (tau -1)*(pb -pu);
        end
    end
end