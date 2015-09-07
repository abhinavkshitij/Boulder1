clc 
clear all

Fs = 256;                        % Sampling frequency
L = 0.259;                       % Length in cm
dx = L/Fs;                      % Sample length (period)cm
x = (0:Fs-1)*dx;                % Time vector
% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
x = sin(2*pi*50*x) + sin(2*pi*100*x); 
y = x;    % Sinusoids plus noise
figure(1)
axis square
subplot(221)
plot(Fs*x(1:64),y(1:64))
title('$$\sin{(2\pi{} 50 t)}+\sin{(2\pi{} 100 t)}$$','interpreter','latex','fontsize',12)
xlabel('time (milliseconds)')

N = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,N)/L;
f = Fs/2*linspace(0,1,N/2+1);

% Plot single-sided amplitude spectrum.
subplot(222)
stem(f,2*abs(Y(1:N/2+1)),'marker','none') 
title('Single-Sided Amplitude Spectrum of y(t)','interpreter','latex','fontsize',12)
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

% Apply filter 
Y(70:end)= 0;
subplot(224)
stem(f,2*abs(Y(1:N/2+1)),'marker','none') 
title('Filtered spectrum - cutoff at 70Hz','interpreter','latex','fontsize',12)
xlabel('Frequency (Hz)')
ylabel('|Y(f)|')

%Take inverse fft
y = ifft(Y,N)*pi*L;
f = Fs/2*linspace(0,1,N/2+1);
subplot(223)
plot(Fs*x(1:64),y(1:64))
title('Filtered field : $$\sin{(2\pi{} 50 t)}$$','interpreter','latex','fontsize',12)
xlabel('time (milliseconds)')



    
