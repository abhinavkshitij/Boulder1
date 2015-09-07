clc
clear all
close all

grid = 256;  Fs=256;                            
vizSlice1 = 64;
vizSlice2 = 128;
vizSlice3 = 192;
LES_filter = 32;


clims=[-20 20];

%% READ VELOCITY FILES:
run ReadVel;
      
    
   %% Task 1a: u_i in three DNS planes:
   
   figure(1);
    colormap jet
    imagesc(U1_DNS(:,:,vizSlice1));
    title('$u_1$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 64');
    axis square;
    %% Compute Filters - LES and Test filters
     disp('Computing Filters...');
    LES = zeros(grid,grid,grid);

center = 0.5*Fs+1;
for i=1:grid
        for j=1:grid
            for k=1:grid
                 if (int8(sqrt( (i-center)^2 + (j-center)^2 + (k-center)^2 )) == LES_filter)               
                 LES(i,j,k) = 1;
                 end     
            end
        end
end
   LES = fftshift(LES);
 
    
    %% Compute TAU_LES: 
   U1_LES = sharp_filter(U1_DNS,LES,Fs);
    
    figure(2);
colormap jet;
  imagesc(U1_LES(:,:,vizSlice1));
    title('$\widetilde{u_1}$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 64');
    axis square;
    
    %%
    figure(3);
    colormap jet
    imagesc(LES(:,:,1));
    title('$u_1$','interpreter','latex','fontsize',12);
    h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    h.YTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
    ylabel('z = 64');
    axis square;