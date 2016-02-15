function [ out ] = sharp_filter( in, filter,L )
%FILTER: Applies spectrally sharp filter in the Fourier domain.
%   The box filter is prepared using the window.m function. The filter process is executed by applying
%   element multiplication with the field. Returns Backward FFT through the
%   inverse FFT operation.

ForwardFFT = fftn(in)/L^3;
ForwardFFT = fftshift(ForwardFFT);
filtered = filter.*ForwardFFT;
out = ifftshift(filtered);
out =  ifftn(out)*L^3;

end

