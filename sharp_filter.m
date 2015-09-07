function [ BackFFT ] = sharp_filter( field, window,L )
%FILTER: Applies spectrally sharp filter in the Fourier domain.
%   The box filter is prepared using the window.m function. The filter process is executed by applying
%   element multiplication with the field. Returns Backward FFT through the
%   inverse FFT operation.

ForwardFFT = fftn(field)/L^3;
filtered = window.*ForwardFFT;
BackFFT = ifftn(filtered)*L^3;

end

