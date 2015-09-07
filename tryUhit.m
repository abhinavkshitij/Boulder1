clc
clear all
close all

grid = 256;                              
vizSlice = 64;
LES_filter = 16;
Test_filter = 32;


velLoc='/Users/Kshitij/Desktop/ALES/DNS_Data/'; 

nx=[grid,grid,grid];                       %computational grid dimensions
lx=[0.259,0.259,0.259]/100;                %physical domain size
dx=lx./nx;                                 %physical grid cell width 
x=linspace(0+dx(1)/2,lx(1)-dx(1)/2,nx(1)); %1D x physical grid
y=linspace(0+dx(2)/2,lx(2)-dx(2)/2,nx(2)); %1D y physical grid
z=linspace(0+dx(3)/2,lx(3)-dx(3)/2,nx(3)); %1D z physical grid

%% READ FILE -- velocity 
    disp(['Reading binary files...'])
    
    %Read in HST velocity fields
    [fid,errmsg]=fopen([velLoc,'Velocity1_0460.bin']);
    tmp=single(fread(fid,nx(1)*nx(2)*nx(3),'single','b'));
    fclose(fid);
    Uhit = reshape(tmp,nx(1),nx(2),nx(3))/100;
    clear tmp ;
    
    
    fid=fopen([velLoc,'Velocity2_0460.bin']);
    tmp=single(fread(fid,nx(1)*nx(2)*nx(3),'single','b'));
    fclose(fid);
    Vhit = reshape(tmp,nx(1),nx(2),nx(3))/100;
    clear tmp ;
     
    
    fid=fopen([velLoc,'Velocity3_0460.bin']);
    tmp=single(fread(fid,nx(1)*nx(2)*nx(3),'single','b'));
    fclose(fid);
    Whit = reshape(tmp,nx(1),nx(2),nx(3))/100;
    clear tmp ;
      
    Ehit = 0.5*(Uhit.^2 + Vhit.^2 + Whit.^2); % Calculate E
    
    disp('Computing Filters...');
    LES = ones(grid,grid,grid);
    test = ones(grid,grid,grid);
    
for i=1:grid
        for j=1:grid
            for k=1:grid
                 if (sqrt( (i-0.5*grid)^2 + (j-0.5*grid)^2 + (k-0.5*grid)^2 ) > LES_filter)               
                 LES(i,j,k) = 0;
                 end
                 if (sqrt( (i-0.5*grid)^2 + (j-0.5*grid)^2 + (k-0.5*grid)^2 ) > Test_filter)               
                 test(i,j,k) = 0;
                end
            end
        end
end
    
   %% FORWARD FFT: 
   % Computing FFT for the data:
    
    Fs = nx(1); %Sampling frequency - grid
    T = 1/Fs;
    L = nx(1);
    x = linspace(0,L,Fs); %How to scale the lengths?
    clims=[-25,25];
    N = 2^nextpow2(L);
    
    figure(1);
    
    % PLOT ORIGINAL FIELD:
    subplot(221);
    imagesc(Uhit(:,:,vizSlice));
    xlabel('x');
    ylabel('y');
    title('Energy field from DNS data','interpreter','latex','fontsize',12);
    
    
    % FORWARD FFT:
    Y = fftn(Uhit)/L^3; 
    f = Fs/2*linspace(0,1,N/2+1);

    
    % DISPLAY ENERGY SPECTRUM:
    subplot(222);
    loglog(f,2*abs(Y(1:N/2+1)));
    title('Energy spectrum','interpreter','latex','fontsize',12);
    xlabel('k');
    ylabel('|Y|');
    
     
    % Applying spectrally sharp filter on FFT-shifted domain:
    Y = fftshift(Y);
    disp(['Applying filter...']); 
    
    Y = Y.*LES;
    
   
    disp(['Completed filtering...']);           
    Y = ifftshift(Y);
   
    % PLOT Filtered spectrum:
    subplot(224);
    loglog(f,2*abs(Y(1:N/2+1)));
    Y_abs = 2*abs(Y(1:N/2+1));
    title('Filtered spectrum','interpreter','latex','fontsize',12)
    xlabel('k');
    ylabel('|Y|');
    


    % Apply inverse FFT and plot:
    
    Uhit = ifftn(Y)*L^3;
    
    subplot(223);
    imagesc(real(Uhit(:,:,vizSlice)));
    title('Filtered energy field','interpreter','latex','fontsize',12);
    xlabel('x');
    ylabel('y');
    
    Y = fftshift(Y);
    lim = [0.5*grid-(2*LES_filter): 0.5*grid+(2*LES_filter)];
    figure(2);
   %% PLOTTING K-SPACE:
    
%     subplot(221);
%     title('Applying spectrally sharp filter at k=16','interpreter','latex','fontsize',12);
%     xlabel('x');
%     ylabel('y'); axis square;
%     [x,y,z] = meshgrid(1:grid,1:grid,1:grid);
%     slice(x,y,z,log(abs(Y)),128,128,128);
      
     disp(['Plotting k-space']); 
     x = (0:L-1)*T;    
     [x,y] = meshgrid(x);
     clev = [0 0.00001];
      
      subplot(131);
      title('kx-ky plane cut','interpreter','latex','fontsize',12);
      %contourf(x(lim,lim),y(lim,lim),(squeeze(abs(Y(lim,lim,128)))),clev);
      contourf(x,y,(squeeze(abs(Y(:,:,128)))),clev);
      xlabel('x');
      ylabel('y'); axis square;
      
      x = (0:L-1)*T;    
      [y,z] = meshgrid(x);
      subplot(132);
      title('ky-kz plane cut','interpreter','latex','fontsize',12);
      %contourf(y(lim,lim),z(lim,lim),(squeeze(abs(Y(128,lim,lim)))),clev);
      contourf(y,z,(squeeze(abs(Y(128,:,:)))),clev);
      xlabel('y');
      ylabel('z'); axis square;
      
      x = (0:L-1)*T;    
      [z,x] = meshgrid(x);
      subplot(133);
      title('kz-kx plane cut','interpreter','latex','fontsize',12);
      %contourf(z(lim,lim),x(lim,lim),(squeeze(abs(Y(lim,128,lim)))),clev);
      contourf(z,x,(squeeze(abs(Y(:,128,:)))),clev);
      xlabel('z');
      ylabel('x'); axis square;


    
    
    
    

    
