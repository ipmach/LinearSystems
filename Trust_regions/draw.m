function draw(X_,R,funct,title_f)
	%Draw the grid
    %Grid
    nx = 40;
    xmin = -3;
    xmax = +3;
    [X,Y] = meshgrid(-5:.5:5);
    Z = funct(X,Y);
    %Plot function
    plot(X_(:,1),X_(:,2),'b-o')
    hold on;
    for i = [1:length(X_)]
        circle(X_(i,1),X_(i,2),R(i))
        hold on;
    end
    contour(X,Y,Z,60);title(title_f);
    colorbar();
end