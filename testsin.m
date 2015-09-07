clc 
clear all

Fs = 1024;                    % Sampling frequency
T = 1/Fs;                     % Sample time (period)
L = 1024;                     % Length of signal
t = (0:L-1)*T;                % Time vector

% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
x = 2*sin(2*pi*50*t) + sin(2*pi*100*t); 
y = x;    % Sinusoids plus noise

% Plot original signal:
figure(1)
axis square
subplot(221)
plot(Fs*t(1:64),y(1:64))
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
y = ifft(Y,N)*L;
f = Fs/2*linspace(0,1,N/2+1);
subplot(223)
plot(Fs*t(1:64),y(1:64))
title('Filtered field : $$\sin{(2\pi{} 50 t)}$$','interpreter','latex','fontsize',12)
xlabel('time (milliseconds)')



    
