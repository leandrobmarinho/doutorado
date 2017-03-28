clear; clc; close all;

img = imread('../../data/imgs/lenna.jpg');
n = numel(img);

subplot(2,3,1), imshow(img);
title('Imagem original.')

% Transformada
transformada = fft2(img);

% Plota a transformada
subplot(2,3,2), imshow(mat2gray(log(abs(transformada)))) 
title('Transformada.')

% Plota a transformada com fftshift
subplot(2,3,3), imshow(mat2gray(log(abs(fftshift(transformada)))))
title('Transformada com shift.')


infft1 = ifft2(transformada);
infft2 = conj(fft2(conj(transformada)))/n;
infft3 = fft2(conj(transformada))/n;

subplot(2,3,4), imshow(uint8(abs(infft1)));
title('Inversa com ifft2.')
subplot(2,3,5), imshow(uint8(abs(infft2)));
title('Inversa com (fft(x*)*)/n.')
subplot(2,3,6), imshow(uint8(abs(infft3)));
title('Inversa com fft(x*)/n.')