clc
clear all
close all

grid = 256;  Fs=256;                            
vizSlice1 = 64;
vizSlice2 = 128;
vizSlice3 = 192;
LES_filter = 128;
Test_filter = 64;

clims=[-20 20];
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

% LES(1:LES_filter+1,1:LES_filter+1,1:LES_filter+1)=1;
% LES(Fs-LES_filter+1:256,1:LES_filter+1,1:LES_filter+1)=1;
% LES(1:LES_filter+1,1:LES_filter+1,Fs-LES_filter+1:256)=1;
% LES(Fs-LES_filter+1:256,1:LES_filter+1,Fs-LES_filter+1:256)=1;
% LES(1:LES_filter+1,Fs-LES_filter+1:256,Fs-LES_filter+1:256)=1;
% LES(Fs-LES_filter+1:256,Fs-LES_filter+1:256,Fs-LES_filter+1:256)=1;
% LES(Fs-LES_filter+1:256,Fs-LES_filter+1:256,1:LES_filter+1)=1;
% LES(1:LES_filter+1,Fs-LES_filter+1:256,1:LES_filter+1)=1;
% 
% test(1:Test_filter+1,1:Test_filter+1,1:Test_filter+1)=1;
% test(Fs-Test_filter+1:256,1:Test_filter+1,1:Test_filter+1)=1;
% test(1:Test_filter+1,1:Test_filter+1,Fs-Test_filter+1:256)=1;
% test(Fs-Test_filter+1:256,1:Test_filter+1,Fs-Test_filter+1:256)=1;
% test(1:Test_filter+1,Fs-Test_filter+1:256,Fs-Test_filter+1:256)=1;
% test(Fs-Test_filter+1:256,Fs-Test_filter+1:256,Fs-Test_filter+1:256)=1;
% test(Fs-Test_filter+1:256,Fs-Test_filter+1:256,1:Test_filter+1)=1;
% test(1:Test_filter+1,Fs-Test_filter+1:256,1:Test_filter+1)=1;

center = 0.5*Fs+1;
for i=1:grid
        for j=1:grid
            for k=1:grid
                 if (sqrt( (i-center)^2 + (j-center)^2 + (k-center)^2 ) <= LES_filter)               
                 LES(i,j,k) = 1;
                 end
                 if (sqrt( (i-center)^2 + (j-center)^2 + (k-center)^2 ) <= Test_filter)               
                 test(i,j,k) = 1;
                end
            end
        end
end
   LES = fftshift(LES);
   test = fftshift(test);
  
%  LES_box = ones(grid,grid,grid);
%     test_box = ones(grid,grid,grid);
%     
% for i=1:grid
%         for j=1:grid
%             for k=1:grid
%                  if ( ((i-0.5*grid)>LES_filter) && ((j-0.5*grid) > LES_filter) && ((k-0.5*grid)>LES_filter) )              
%                  LES_box(i,j,k) = 0;
%                  end
%                  if ( ((i-0.5*grid)>Test_filter) && ((j-0.5*grid) > Test_filter) && ((k-0.5*grid)>Test_filter) )             
%                  test_box(i,j,k) = 0;
%                 end
%             end
%         end
% end
%   LES_box = fftshift(LES_box);
%   test_box = fftshift(test_box);
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
   
   
    