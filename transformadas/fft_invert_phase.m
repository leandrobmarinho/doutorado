clear; clc; close all;

imgA = imread('../data/imgs/lenna.jpg');
imgB = imread('../data/imgs/woman_blonde.tif');

novo_tamanho = [300 300];
imgA = imresize(imgA, novo_tamanho);
imgB = imresize(imgB, novo_tamanho);

fftA = fft2(double(imgA));
fftB = fft2(double(imgB));

anguloA = angle(fftA);
anguloB = angle(fftB);

magA = abs(fftA);
magB = abs(fftB);

figure, imshow(mat2gray(log(abs(fftshift(magA)))))
figure, imshow(mat2gray(log(abs(fftshift(magB)))))
figure, imshow(anguloA)
figure, imshow(anguloB)

% Inverte as fases
fftC = magA.*exp(i*anguloB);
fftD = magB.*exp(i*anguloA);

figure, imshow(mat2gray(log(abs(fftshift(fftA)))))
figure, imshow(mat2gray(log(abs(fftshift(fftB)))))
figure, imshow(mat2gray(log(abs(fftshift(fftC)))))
figure, imshow(mat2gray(log(abs(fftshift(fftD)))))


inversaC = ifft2(fftC);
inversaD = ifft2(fftD);


figure
subplot(2,2,1), imshow(imgA);
title('Imagem A')
subplot(2,2,2), imshow(imgB);
title('Imagem B')
subplot(2,2,3), imshow(uint8(inversaC));
title('Magnitude da imagem A com fase da B')
subplot(2,2,4), imshow(uint8(inversaD));
title('Magnitude da imagem B com fase da A')
set(gcf,'units','normalized','outerposition',[0 0 1 1])


