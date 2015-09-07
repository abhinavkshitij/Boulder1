clc 
clear all

Fs = 256; % Number of sample points : SAMPLING FREQUENCY
L = Fs;

x = linspace(0,2*pi(),Fs); % the real length of the field
filter = 2;

% A sinusoidal wave:
 % y = sin(2*pi()*x)+ 2*sin(2*pi()*10*x) +0.1; 
y = sin(x)+ 2*sin(10*x) +sin(20*x) +0.3; 

% Plot original field:
figure(1); subplot(231); axis square;
plot(x,y);
title('$$\sin(2\pi x)+sin(2\pi 2x)  $$','interpreter','latex','fontsize',12)

% FORWARD FFT on Original Spectrum:
F_fft = fftn(y)/L; %This has to scaled by the sampling frequency

% Mesh plot:
subplot(232);
stem(real(F_fft));
title('Real part- FFT','interpreter','latex','fontsize',12);
xlabel('x');
ylabel('y');

% Mesh plot:
subplot(233);
stem(imag(F_fft));
title('Imaginary part- FFT','interpreter','latex','fontsize',12);
xlabel('x');
ylabel('y');

% Mesh plot:
subplot(236);
stem(abs(F_fft));
title('Magnitude - FFT','interpreter','latex','fontsize',12);
xlabel('x');
ylabel('y');

% Apply filter:
LES = linspace(1,1,Fs); %Initialize the filter as 1


    for i=1:Fs
       if (sqrt((i-(0.5*Fs+1))^2) > filter )
       % if ((sqrt((i-(0.5*Fs+1))^2) > filter) )
            LES(i) = 0;
        end
    end
 LES = fftshift(LES);
LES(1)=0;
 filtered_fft = LES.*F_fft;
% imag_filtered_fft = LES.*imag(F_fft);

% % Apply inverse fftshift:
% 
% subplot(236);
% mesh(x,y,(2*abs(Y)));
% xlabel('x');
% ylabel('y');
% title('Filter at k = 64','interpreter','latex','fontsize',12)
% Y = ifftshift(Y);


subplot(235);
stem(abs(filtered_fft));xlabel('x');ylabel('y');
title('Backward FFT','interpreter','latex','fontsize',12)


%Take inverse fft
i_fft = ifftn(filtered_fft)*L;
subplot(234);
axis equal;
plot(x,i_fft);
title('$$\sin{(2\pi50x)}$$','interpreter','latex','fontsize',12);





    
