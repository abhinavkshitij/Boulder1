clc
clear all
close all

grid = 256;                              
vizSlice1 = 64;
vizSlice2 = 128;
vizSlice3 = 192;
LES_filter = 128;
Test_filter = 64;

clims=[-20 20];
c_tau = [-4 4]; %automate this part using maxval,minval
c_Ehit= [0 440];

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
    U_DNS = reshape(tmp,nx(1),nx(2),nx(3))/100;
    clear tmp ;
    
    
    fid=fopen([velLoc,'Velocity2_0460.bin']);
    tmp=single(fread(fid,nx(1)*nx(2)*nx(3),'single','b'));
    fclose(fid);
    V_DNS = reshape(tmp,nx(1),nx(2),nx(3))/100;
    clear tmp ;
     
    
    fid=fopen([velLoc,'Velocity3_0460.bin']);
    tmp=single(fread(fid,nx(1)*nx(2)*nx(3),'single','b'));
    fclose(fid);
    W_DNS = reshape(tmp,nx(1),nx(2),nx(3))/100;
    clear tmp ;
    
    E_DNS = 0.5*(U_DNS.^2 + V_DNS.^2 + W_DNS.^2); % Calculate KE
    
    
   %% FORWARD FFT: 
   % Computing FFT for the data:
    
    Fs = 256; %Sampling frequency - grid size
    L = 0.259/100; % length of the signal
    N = 2^nextpow2(Fs);
   

    % FORWARD FFT:
    %Y = fftn(E_DNS);
    Y = E_DNS;
for p = 1:length(size(E_DNS))
    Y = fft(Y,[],p);
end
    f = Fs/2*linspace(0,1,N/2+1);%Its originally Fs/2
    Y_ABS = abs(Y)/(N^3);
    
    figure(2);
    loglog(f(1:128),Y_ABS(1:128));
    axis ([1E0 1E3 1E-5 1E0]);
    xlabel('k');
    ylabel('E(k)'); 
      
    % Applying spectrally sharp filter LES scale:
    %Y_ABS = fftshift(Y_ABS);
    disp(['Applying filter...']); 
    
    figure(1);
    imagesc(Y_ABS(:,:,vizSlice2));
    
    % Compute E(k):
    Ek = Fs/2*linspace(0,1,N/2+1);
    
    for m=2:129
        
    for i=1:129
        for j=1:129
            for k=1:129
                 if ((sqrt( i^2 + j^2 + k^2 ) > f(m-1))&&(sqrt( i^2 + j^2 + k^2 ) < f(m)))               
                 Ek(m) = Ek(m)+Y_ABS(i,j,k); 
                end
            end
        end   
    end
    Ek(m) = Ek(m)/(4*pi*m^2);
    end
    
    % DISPLAY ENERGY SPECTRUM - LES:
    %subplot(222);
    figure(3);
    loglog(f(1:128),Ek(1:128));
    axis ([1E0 1E3 1E-5 1E0]);
    xlabel('k');
    ylabel('E(k)'); 
    
    
    
