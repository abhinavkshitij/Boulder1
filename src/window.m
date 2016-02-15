disp('Computing Filters...');
    LES = ones(grid,grid,grid);
    test = ones(grid,grid,grid);
    
for i=1:grid
        for j=1:grid
            for k=1:grid
                 if (sqrt( (double(i)-0.5*grid)^2 + (double(j)-0.5*grid)^2 + (double(k)-0.5*grid)^2 ) > LES_filter)               
                 LES(i,j,k) = 0;
                 end
                 if (sqrt( (double(i)-0.5*grid)^2 + (double(j)-0.5*grid)^2 + (double(k)-0.5*grid)^2 ) > Test_filter)               
                 test(i,j,k) = 0;
                end
            end
        end
end
  LES = fftshift(LES);
  test = fftshift(test);
  
  save('Window_LES','LES');
  save('Window_test','test');