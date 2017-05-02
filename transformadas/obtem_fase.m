clear; clc; close all;

img = rgb2gray(imread('roger.jpg'));

fft = fft2(double(img));

fase = angle(fft);

mag = abs(fft);

figure, imshow(mat2gray(log(abs(fftshift(mag)))))
figure, imshow((log(abs(fftshift(fase)))))

save('fase', 'fase')