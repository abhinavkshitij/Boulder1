clc 
clear all

Fs = 256; % Number of sample points : SAMPLING FREQUENCY
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
imagesc(z(1:64,1:64));
%imagesc(z);

title('$$2\cos(10x)+cos(20y)+0.3 $$','interpreter','latex','fontsize',12)
%title('$$\cos(10x)+cos(20y)+2cos(15x+16y)+0.3  $$','interpreter','latex','fontsize',12)% FORWARD FFT on Original Spectrum:
F_fft = fftn(z)/L^2;

% Mesh plot:
subplot(232);
stem(abs(F_fft(1,:)),'marker','none');
title('Forward FFT','interpreter','latex','fontsize',12);
xlabel('kx');


% Mesh plot:
subplot(233);
stem(abs(F_fft(:,1)),'marker','none');
title('Forward FFT','interpreter','latex','fontsize',12);
xlabel('ky');

% Mesh plot:
subplot(236);
mesh(abs(F_fft));
title('Magnitude - FFT','interpreter','latex','fontsize',12);
xlabel('kx');
ylabel('ky');

% Apply filter:

% for j=1:length(Y)
%     for i=1:length(Y)
%         if (sqrt((i-0.5*length(Y))^2+(j-0.5*length(Y))^2) > filter) 
%             Y(i,j) = 0;
%         end
%     end
% end

LES = zeros(Fs,Fs); %Initialize the filter as 1

%% Round 2D filter:
center = 0.5*Fs+1; %[129,129]
for i=1:Fs    
for j=1:Fs
       if (sqrt((i-center)^2+(j-center)^2) <= filter )
            LES(i,j) = 1;
        end
end
end
 LES = fftshift(LES);

%% BOX filter:
% startBox = 0.5*Fs-filter+1;
% endBox = 0.5*Fs+filter+1;
% LES(startBox:endBox,startBox:endBox)=1;
% LES = fftshift(LES);

%%
 filtered_fft = LES.*F_fft;

subplot(235);
mesh(abs(filtered_fft));
xlabel('kx');
ylabel('ky');
title('Filter at k = 15','interpreter','latex','fontsize',12)



%Take inverse fft
back_fft = ifftn(filtered_fft)*L^2;
subplot(234);
axis equal;
imagesc(back_fft(1:64,1:64));
%imagesc(back_fft);
title('$$\cos{(10x)}$$','interpreter','latex','fontsize',12);





    
