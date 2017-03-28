close all; clear; clc;
img = imread('../data/imgs/lenna.jpg');

img=zeros(30,30); img(5:24,13:17)=1;


F1 = fft2(img);
F1_abs = abs(F1);
ang1 = angle(F1);

F2 = fft2(img, 256, 256);
F2_abs = abs(F2);


figure, imshow(uint8(ifft2(fftshift((F1)))))
figure, imshow(uint8(ifft2(((F1)))))
figure, imshow(fftshift(F1_abs),[], 'InitialMagnification','fit')
% figure, imshow(fftshift(F2_abs),[], 'InitialMagnification','fit')
% figure, surf(ang1)