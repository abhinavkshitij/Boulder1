clc 
clear all

Fs = 256; % Number of sample points : SAMPLING FREQUENCY
L = Fs; grid = 256;
nx=[grid,grid,grid]; 

% x = linspace(0,2*pi(),Fs);
% 
% [x,y] = meshgrid(x);
filter = 15;

 velLoc='/Users/Kshitij/Desktop/ALES/DNS_Data/'; 
% %Read in HST velocity fields
    [fid,errmsg]=fopen([velLoc,'Velocity1_0460.bin']);
    tmp=single(fread(fid,nx(1)*nx(2)*nx(3),'single','b'));
    fclose(fid);
    Uhit = reshape(tmp,nx(1),nx(2),nx(3))/100;
    clear tmp ;

    disp (Uhit(1,1,129));
    
% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid:
z = Uhit;
% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid:
%z = 2*sin(10*x) + sin(20*y)+ 2*sin(10*x*y)+0.3; 

% Plot original field:
figure(1);
subplot(231);
axis square;
%imagesc(z(1:64,1:64));
imagesc(z(:,:,1));

title('$$\sin(2\pi 50x)+sin(2\pi 100y)  $$','interpreter','latex','fontsize',12)

% FORWARD FFT on Original Spectrum:
F_fft = fftn(z)/L^3;

% Mesh plot:
subplot(232);
mesh(real(F_fft(:,:,1)));
title('Forward FFT','interpreter','latex','fontsize',12);
xlabel('x');
ylabel('y');


% Mesh plot:
subplot(233);
mesh(imag(F_fft(:,:,1)));
title('Imaginary part- FFT','interpreter','latex','fontsize',12);
xlabel('x');
ylabel('y');

% Mesh plot:
subplot(236);
mesh(abs(F_fft(:,:,1)));
title('Magnitude - FFT','interpreter','latex','fontsize',12);
xlabel('x');
ylabel('y');

% Apply filter:

% for j=1:length(Y)
%     for i=1:length(Y)
%         if (sqrt((i-0.5*length(Y))^2+(j-0.5*length(Y))^2) > filter) 
%             Y(i,j) = 0;
%         end
%     end
% end

LES = zeros(256,256,256); %Initialize the filter as 1
% LES(2:16,242:256)=1;
% LES(2:16,2:16)=1;
% LES(242:256,242:256)=1;
% LES(242:256,2:16)=1;

%% 2D Filter:
% LES(1:16,242:256)=1;
% LES(1:16,1:16)=1;
% LES(242:256,242:256)=1;
% LES(242:256,1:16)=1;

%     for i=1:Fs
%        if (sqrt((i-(0.5*Fs+1))^2) > filter )
%        % if ((sqrt((i-(0.5*Fs+1))^2) > filter) )
%             LES(i) = 0;
%         end
%     end
%  LES = fftshift(LES);
% LES(1)=0;
%% 3D Filter:

LES(1:16,1:16,1:16)=1;
LES(242:256,1:16,1:16)=1;
LES(1:16,1:16,242:256)=1;
LES(242:256,1:16,242:256)=1;
LES(1:16,242:256,242:256)=1;
LES(242:256,242:256,242:256)=1;
LES(242:256,242:256,1:16)=1;
LES(1:16,242:256,1:16)=1;
%%
 filtered_fft = LES.*F_fft;

% Apply inverse fftshift:

subplot(236);
mesh(abs(filtered_fft(:,:,1)));
xlabel('x');
ylabel('y');
title('Filter at k = 64','interpreter','latex','fontsize',12)



% subplot(235);
% mesh(x,y,(2*abs(Y)));
% xlabel('x');
% ylabel('y');
% title('Backward FFT','interpreter','latex','fontsize',12)


%Take inverse fft
back_fft = ifftn(filtered_fft)*L^3;
subplot(234);
axis equal;
%imagesc(back_fft(1:64,1:64));
imagesc(back_fft(:,:,1));
title('$$\sin{(2\pi50x)}$$','interpreter','latex','fontsize',12);

 disp (back_fft(1,1,129));



    
