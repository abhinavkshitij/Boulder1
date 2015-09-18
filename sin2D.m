clc 
clear all

Fs = 256; % Number of sample points : SAMPLING FREQUENCY
L = Fs;
x = linspace(0,2*pi(),Fs);
grid =Fs;
[x,y] = meshgrid(x);
filter = 15;
clims = [-4 4];

%% LOAD VELOCITY FIELD:

% run ReadUhit
% z = Uhit(:,128,128); % 2D data

%% LOAD SINUSOIDAL TEST FUNCTION:

%z = 2*cos(10*x) + cos(20*y)+ 2*cos(15*x+16*y)+ 0.25; 
%z = 2*cos(10*x) + cos(20*y)+ 0.25; 
z = cos(x) + cos(2*y);
%%
% Plot original field:
figure(1);colormap jet;
subplot(231);
axis square;
imagesc(z(1:Fs/2+1,1:Fs/2+1),clims);xlabel('x');ylabel('y');
h = gca; h.XTick = [0, 0.25*grid,0.5*grid];
h.YTick = [0,0.25*grid,0.5*grid];

%imagesc(z);

%title('$$2\cos(10x)+cos(20y)+0.25 $$','interpreter','latex','fontsize',12)
title('$$\cos(10x)+cos(20y)+2cos(15x+16y)+0.25  $$','interpreter','latex','fontsize',12)% FORWARD FFT on Original Spectrum:
F_fft = fftn(z)/L^2;

% Mesh plot:
subplot(232);
stem(abs(F_fft(1,1:Fs/2+1)),'marker','none');
title('Fwd FFT(magnitude)-kx','interpreter','latex','fontsize',12);
xlabel('kx');
h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
h.YTick = [0,0.25,0.5,0.75,1];


% Mesh plot:
subplot(233);
stem(abs(F_fft(1:Fs/2+1,1)),'marker','none');
title('Fwd FFT(magnitude)-ky','interpreter','latex','fontsize',12);
xlabel('ky');
h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
h.YTick = [0,0.25,0.5,0.75,1];

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
stem(abs(filtered_fft(1,1:Fs/2+1)),'marker','none');
xlabel('kx');
title('Filter at k = 15','interpreter','latex','fontsize',12)
h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
h.YTick = [0,0.25,0.5,0.75,1];
    
subplot(236);
stem(abs(filtered_fft(1:Fs/2+1,1)),'marker','none');
xlabel('ky');
title('Filter at k = 15','interpreter','latex','fontsize',12);
h = gca; h.XTick = [0, 0.25*grid, 0.5*grid, 0.75*grid, grid];
h.YTick = [0,0.25,0.5,0.75,1];


%Take inverse fft
back_fft = ifftn(filtered_fft)*L^2;
subplot(234);xlabel('x');ylabel('y');
axis equal;
imagesc(back_fft(1:Fs/2+1,1:Fs/2+1),clims);
%imagesc(back_fft);
title('$$2\cos{(10x)+0.25}$$','interpreter','latex','fontsize',12);
h = gca; h.XTick = [0, 0.25*grid,0.5*grid];
h.YTick = [0,0.25*grid,0.5*grid];

%% Kx-ky
figure(2);
axis square;
contour(abs(F_fft(1:Fs/8+1,1:Fs/8+1)),[0 0.3]);
xlabel('kx');ylabel('ky');





    
