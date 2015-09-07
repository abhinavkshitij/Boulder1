clc 
clear all
close all

grid = 256; 
nx=[grid,grid,grid]; 

Fs = 512;                    % Sampling frequency
T = 1/Fs;                     % Sample time (period)
L = 256;                     % Length of signal
x = (0:L-1)*T;    
[x,y] = meshgrid(x);
filter = 20;


velLoc='/Users/Kshitij/Desktop/ALES/DNS_Data/'; 
%Read in HST velocity fields
    [fid,errmsg]=fopen([velLoc,'Velocity1_0460.bin']);
    tmp=single(fread(fid,nx(1)*nx(2)*nx(3),'single','b'));
    fclose(fid);
    Uhit = reshape(tmp,nx(1),nx(2),nx(3))/100;
    clear tmp ;

    disp (Uhit(1,1,129));
    
% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid:
z = Uhit(:,:,128);

N = 2^nextpow2(L);
f = Fs/2*linspace(0,1,N/2+1);

% Plot original field:
figure(1);
subplot(241);
axis square;
imagesc(z);
title('Original field','interpreter','latex','fontsize',12)

% FORWARD FFT on Original Spectrum:
Y = fftn(z)/L^2;
subplot(242);
loglog(f,2*abs(Y(1:N/2+1)),'marker','none') ;
title('Original spectrum','interpreter','latex','fontsize',12);
xlabel('k');
ylabel('|Y(f)|');
axis([1E0 1E3 1E-5 1E0]); 


% Mesh plot:
subplot(243);
mesh(x,y,log(abs(Y)));
title('Forward FFT','interpreter','latex','fontsize',12);
xlabel('x');
ylabel('y');



% Apply fftshift:
Y = fftshift(Y);
subplot(244);
mesh(x,y,log(abs(Y)));
title('FFT shift','interpreter','latex','fontsize',12);
xlabel('x');
ylabel('y');


% Apply filter:

for j=1:length(Y)
    for i=1:length(Y)
        if (sqrt((i-0.5*length(Y))^2+(j-0.5*length(Y))^2) > filter) 
            Y(i,j) = 0;
        end
    end
end

% Apply inverse fftshift:

subplot(248);
contourf(x,y,log(abs(Y)));
xlabel('x');
ylabel('y');
axis equal;
title('Filter at k = 20','interpreter','latex','fontsize',12)
Y = ifftshift(Y);

subplot(247);
mesh(x,y,log(abs(Y)));
xlabel('x');
ylabel('y');
title('Backward FFT','interpreter','latex','fontsize',12)

% Plot 2D amplitude spectrum:
subplot(246);
loglog(f,2*abs(Y(1:N/2+1)),'marker','none') ;
title('Filtered spectrum','interpreter','latex','fontsize',12);
xlabel('k')
ylabel('|Y(f)|')
axis([1E0 1E3 1E-5 1E0]); 

%Take inverse fft
z = ifftn(Y)*L^2;

subplot(245)
imagesc(real(z));
title('Filtered field','interpreter','latex','fontsize',12);
