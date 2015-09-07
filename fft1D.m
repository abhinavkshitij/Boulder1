clc
clear all
close all

velLoc='/Users/Kshitij/Desktop/ALES/DNS_Data/'; 
vizSlice = 64;

nx=[256,256,256];                          %computational grid dimensions
lx=[0.259,0.259,0.259]/100;                %physical domain size

   
    disp(['Reading binary file...'])
    
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
      
    
   % EhitX = UhitX.^2 + VhitX.^2 + WhitX.^2;
    Ehit = 0.5*(Uhit.^2 + Vhit.^2 + Whit.^2);
    clear UhitX;
    clear VhitX;
    clear WhitX;
    
    Ehit = Ehit(128,:,128);
   %Ehit = Ehit (:,:,128);
    
    % Computing FFT for the data:
    
    Fs = 256; %Sampling frequency = 256
    T = 1/Fs;  % Time period
    L = nx(1); % Length of the signal  = 256
    x = linspace(0,L-1,Fs); % 0 to 255
    
    clims=[-25,25];
    figure();
    subplot(221);
    %imagesc(squeeze(Ehit(:,:,vizSlice)),clims);
    plot(x, Ehit);
    title('Energy field from DNS data','interpreter','latex','fontsize',12);
    axis ([0 256 0 500])
    xlabel('N');
    ylabel('E');
    
    %NFFT = 2^nextpow2(L);
    N = 256;
    Y = fftn(Ehit)/L;
    f = Fs/2*linspace(0,1,N/2+1);
    
    subplot(222);
    
    loglog(f,2*abs(Y(1:N/2+1)));
    title('Energy spectrum','interpreter','latex','fontsize',12);
    xlabel('k')
    ylabel('|Y|')
    axis ([1E0 1E3 1E-3 1E2]); axis square;
    
    
    % Apply filter 
    filter = 64;
    Y(filter:end)=0;
    subplot(224);
    axis ([min(Y) max(Y) min(f) max(f)]);
    loglog(f,2*abs(Y(1:N/2+1)));
    title('Filtered spectrum','interpreter','latex','fontsize',12)
    xlabel('k');
    ylabel('|Y|');
    axis ([1E0 1E3 1E-3 1E2]); axis square;

    %Take inverse fft
    Ehit = ifftn(Y)*L;
    subplot(223);
    plot(x, abs(Ehit));
    title('Filtered energy field','interpreter','latex','fontsize',12);
    xlabel('N');
    ylabel('E');
    axis ([0 256 0 500]);
    
    
    
    
    

    
