function [X_,R,Xm] = trustRegion(f,m,g,B,r,x,n,tau)
    %Trust method for function f(x,p),  m(x,p)
    % g: jacobian B:Hessian r: radius 
    % x: initial point n: parameter
    % tau < 0 cauchy Point, tau in [0,2] dogLeg, tau > 2 error
    X_ = [x];
    Xm = [];
    R = [r];
    r_ = 4;
    for k = [1:60]
        if tau < 0
            p = cauchyPoint(g,B,r,x(1),x(2));
        else
            p = dogLeg(g,B,r,x(1),x(2),tau);
        end
        p_ = (f(x(1),x(2)) - f(x(1)+p(1),x(2)+p(2)))/ (m(x,zeros(length(x),1)) - m(x,p));
        if p_ < 0.25
           r = 0.25 * r; 
        else
            if p_ > 0.75 & norm(p) == r
                r = min(2*r,r_);
            end
        end
        R = [R;r];
        if p_> n
            x = x+p;
        end
        X_ = [X_,x];
        Xm = [Xm, p_];
    end
    X_ = X_';
end