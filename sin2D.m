clc 
clear all

Fs = 1024; % Number of sample points : SAMPLING FREQUENCY
L = Fs;
x = linspace(0,2*pi(),Fs);

[x,y] = meshgrid(x);
filter = 15;

%% LOAD VELOCITY FIELD:

% run ReadUhit
% z = Uhit(:,128,128); % 2D data

%% LOAD SINUSOIDAL TEST FUNCTION:

%z = 2*cos(10*x) + cos(20*y)+ 2*cos(15*x+16*y)+ 0.3; 
z = 2*cos(10*x) + cos(20*y)+ 0.3; 

%%
% Plot original field:
figure(1);
subplot(231);
axis square;
%imagesc(z(1:64,1:64));
imagesc(z);

title('$$\sin(2\pi 50x)+sin(2\pi 100y)  $$','interpreter','latex','fontsize',12)
title('$$\sin(2\pi 50x)+sin(2\pi 100y)  $$','interpreter','latex','fontsize',12)
% FORWARD FFT on Original Spectrum:
F_fft = fftn(z)/L^2;

% Mesh plot:
subplot(232);
mesh(real(F_fft));
title('Forward FFT','interpreter','latex','fontsize',12);
xlabel('x');
ylabel('y');


% Mesh plot:
subplot(233);
mesh(imag(F_fft));
title('Imaginary part- FFT','interpreter','latex','fontsize',12);
xlabel('x');
ylabel('y');

% Mesh plot:
subplot(236);
mesh(abs(F_fft));
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

LES = zeros(Fs,Fs); %Initialize the filter as 1
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

%% Using 2D fftshift:
LES(0.5*Fs-filter+1:0.5*Fs+filter+1,0.5*Fs-filter+1:0.5*Fs+filter+1)=1;
LES=fftshift(LES);
%%
 filtered_fft = LES.*F_fft;

% Apply inverse fftshift:

subplot(236);
mesh(abs(filtered_fft));
xlabel('x');
ylabel('y');
title('Filter at k = 64','interpreter','latex','fontsize',12)



% subplot(235);
% mesh(x,y,(2*abs(Y)));
% xlabel('x');
% ylabel('y');
% title('Backward FFT','interpreter','latex','fontsize',12)


%Take inverse fft
back_fft = ifftn(filtered_fft)*L^2;
subplot(234);
axis equal;
%imagesc(back_fft(1:64,1:64));
imagesc(back_fft);
title('$$\sin{(2\pi50x)}$$','interpreter','latex','fontsize',12);





    
