function p = cauchyPoint(g,B,r,x,y)
    g_v= g(x,y); %Jacobian vector
    g_n = norm(g(x,y)); %Jacobian norm
    aux = g_v' * B(x,y) * g_v; % gT*B*g
    if aux <= 0
        tau = 1;
    else
        tau = min((g_n^3)/(r*aux),1);
    end
    p = -tau * (r * g_v)/g_n;
end 