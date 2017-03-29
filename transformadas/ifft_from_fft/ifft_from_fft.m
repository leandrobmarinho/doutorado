clear; clc; close all;

img = imread('../../data/imgs/lenna.jpg');
n = numel(img);

subplot(2,3,1), imshow(img);
title('Imagem original.')

% Transformada
transformada = (fft2(img));

% Plota a transformada
subplot(2,3,2), imshow(mat2gray(log(abs(transformada)))) 
title('Transformada.')

% Plota a transformada com fftshift
subplot(2,3,3), imshow(mat2gray(log(abs(fftshift(transformada)))))
title('Transformada com shift.')


infft1 = ifft2(transformada);
infft2 = conj(fft2(conj(transformada)))/n;
infft3 = fft2(conj(transformada))/n;

subplot(2,3,4), imshow(uint8(infft1));
title('Inversa com ifft2.')
subplot(2,3,5), imshow(uint8(infft2));
title('Inversa com (fft(x*)*)/n.')
subplot(2,3,6), imshow(uint8(infft3));
title('Inversa com fft(x*)/n.')
set(gcf,'units','normalized','outerposition',[0 0 1 1])

infft1 = ifft2(transformada);
infft2 = conj(fft2(conj(transformada)))/n;
infft3 = fft2(conj(transformada))/n;

figure
subplot(2,3,1), imshow(uint8(infft1));
title('Inversa com ifft2.')
subplot(2,3,2), imshow(uint8(infft2));
title('Inversa com (fft(x*)*)/n.')
subplot(2,3,3), imshow(uint8(infft3));
title('Inversa com fft(x*)/n.')

transformada = fftshift(transformada);
infft1 = ifft2(transformada);
infft2 = conj(fft2(conj(transformada)))/n;
infft3 = fft2(conj(transformada))/n;

subplot(2,3,4), imshow(uint8(infft1));
title('Inversa com ifft2 (shift na transformada).')
subplot(2,3,5), imshow(uint8(infft2));
title('Inversa com (fft(x*)*)/n (shift na transformada).')
subplot(2,3,6), imshow(uint8(infft3));
title('Inversa com fft(x*)/n (shift na transformada).')
set(gcf,'units','normalized','outerposition',[0 0 1 1])


figure
transformada = fftshift(transformada);
% subplot(2,3,1), imshow(angle(transformada))
% title('Fase')


subplot(1,2,1), imshow(img)
title('Imagem original.')
subplot(2,2,2), imshow(mat2gray(log(abs(fftshift(transformada)))))
title('Magnitude da Transformada')
subplot(2,2,4), imshow(angle(transformada))
title('Fase da Transformada')
set(gcf,'units','normalized','outerposition',[0 0 1 1])


%% Apenas uma linha da imagem
sinal = img(1,:);
sinal = double(sinal);
n = length(sinal);
trans_sin = fft(sinal);

infft1 = ifft(trans_sin);
infft2 = conj(fft(conj(trans_sin)))/n;
infft3 = fft(conj(trans_sin))/n;

mse(sinal, real(infft1))
mse(sinal, real(infft2))
mse(sinal, real(infft3))

figure
subplot(3,2,1), plot(sinal)
title('Sinal original.')
subplot(3,2,3), plot(abs(trans_sin))
title('Magnitude do sinal.')
subplot(3,2,4), plot(angle(trans_sin))
title('Fase do sinal.')
subplot(3,2,5), plot(real(infft2))
title('Inversa com (fft(x*)*)/n.')
subplot(3,2,6), plot(real(infft3))
title('Inversa com fft(x*)/n.')

set(gcf,'units','normalized','outerposition',[0 0 1 1])