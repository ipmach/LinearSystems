function grid = createGrid(n)
   %Create grid
   ini_grid =0; 
   end_grid = 1;
   h = (end_grid - ini_grid)/(n-1);
   grid = zeros(1,n);
   grid(1) = ini_grid;
   grid(n) = end_grid;
   for i= 2:n-1
       grid(i) = grid(i-1) +h;
   end    
end