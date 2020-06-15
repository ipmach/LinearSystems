function p = evaluation(f,pc,x,y)
    p = (f(x,y) - f(x + pc(1), y + pc(2))) / (f(0,0) - f(pc(1),pc(2)));
end