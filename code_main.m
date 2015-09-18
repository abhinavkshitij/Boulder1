clc
clear all
close all

grid = 256;  Fs=256;                            
vizSlice1 = 64;
vizSlice2 = 128;
vizSlice3 = 192;
LES_filter = 16;% dont change this anymore!!!!
Test_filter = 8;%just doonn't!!

clims=[-40 40];
c_Ehit= [0 440];

%% READ VELOCITY FILES:
run ReadVel;

E_DNS = 0.5*(U1_DNS.^2 + U2_DNS.^2 + U3_DNS.^2); % Calculate E
      
    
   %% Task 1a: u_i in three DNS planes:
   
   run plot_DNS;
    
    %% Compute Filters - LES and Test filters
     disp('Computing Filters...');
    LES = zeros(grid,grid,grid);
    test = zeros(grid,grid,grid);

center = 0.5*Fs+1;
% Box filter:
%LES(center-LES_filter:center+LES_filter,center-LES_filter:center+LES_filter,center-LES_filter:center+LES_filter)=1;
%test(center-Test_filter:center+Test_filter,center-Test_filter:center+Test_filter,center-Test_filter:center+Test_filter)=1;


for i=1:grid
        for j=1:grid
            for k=1:grid
                d = sqrt( (i-center)^2 + (j-center)^2 + (k-center)^2 );
                %d = (i-center)^2 + (j-center)^2 + (k-center)^2;
                %LES(i,j,k)= exp(-d/(2*LES_filter^2));%gaussian
                %test(i,j,k)= exp(-d/(2*Test_filter^2));%Gaussian
                 if (d <= LES_filter)               
                 LES(i,j,k) = 1;
                 end
                 if (d  <= Test_filter)               
                 test(i,j,k) = 1;
                end
            end
        end
end
   LES = fftshift(LES);
   test = fftshift(test);
  
  %% FORWARD FFT: 
   % Computing FFT for the data:
    
    Fs = 256; %Sampling frequency - grid size
    L = nx(1); % length of the signal
    x = linspace(1,L,Fs); %How to scale the lengths?
    clims=[-25,25];
    N = 2^nextpow2(L);
    
    figure(1);
    colormap jet;
    
    % PLOT ORIGINAL FIELD:
    subplot(321);
    imagesc(E_DNS(:,:,vizSlice2),c_Ehit);
    xlabel('x');
    ylabel('y');
    title('KE - DNS (z=128)','interpreter','latex','fontsize',12);
    axis square;
    
    % FORWARD FFT:
    Y = fftn(E_DNS)/L^3;
    
    f = Fs/2*linspace(0,1,N/2+1);%Its orginally Fs/2
    
    Ek = Fs/2*linspace(0,1,N/2+1);
    
    run plotEk;
    
     % DISPLAY ENERGY SPECTRUM - LES:
    subplot(322);
    loglog(f(1:128),Ek(1:128));
    axis ([1E0 1E3 1E-5 1E0]);
    xlabel('k');
    ylabel('E(k)'); 
    
    % Applying spectrally sharp filter LES scale:
    disp(['Applying filter...']); 
    
    Y = LES.*Y;
   
    disp(['Completed filtering...']);           
    
    Ek(LES_filter:end) = 0;
    
    % PLOT Filtered spectrum:
    subplot(324);
    loglog(f(1:LES_filter),Ek(1:LES_filter));
    axis ([1E0 1E3 1E-5 1E0]);
    ylabel('E(k)'); 
   
    
    % Apply inverse FFT and plot:
    
    E_LES_back = ifftn(Y)*L^3;
    E_LES= E_LES_back;
    subplot(323);
    imagesc(E_LES(:,:,vizSlice2),c_Ehit);
    title('KE - LES scale','interpreter','latex','fontsize',12);
    xlabel('x');
    ylabel('y');
    axis square;
    
    %% Compute TAU_LES: 
    
    run tau_LES; %True SGS stress from DNS and LES data
    run plot_LES;
    
    %% Compute TAU_TEST :(^)
        
    run tau_test; %Test stress from LES and test-filtered data
    run plot_test;
    
    run maxminval; % FOR COMMON SCALES
    run plot_tau_LES;
    run plot_tau_test;
    %% Plot Energy spectrum:
    
    figure(1); 
    % FORWARD FFT:
    Y = fftn(E_LES)/L^3;
    Y = test.*Y;          
    Ek(Test_filter:end) = 0;
    
    % PLOT Filtered spectrum:
    subplot(326);
    loglog(f(1:Test_filter),Ek(1:Test_filter));
    axis ([1E0 1E3 1E-5 1E0]);
    ylabel('E(k)'); 
    
    % Apply inverse FFT and plot:
    
    E_test = ifftn(Y)*L^3;
    
    subplot(325);
    imagesc(E_test(:,:,vizSlice2),c_Ehit);
    title('KE - Test scale','interpreter','latex','fontsize',12);
    xlabel('x');
    ylabel('y');
    axis square;
   
   
    