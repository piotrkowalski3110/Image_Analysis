clear all; close all; clc;
I5SP = imnoise(rgb2gray(imread('Lenna_(test_image).png')),"salt & pepper",0.05);
I15SP = imnoise(rgb2gray(imread('Lenna_(test_image).png')),"salt & pepper",0.15);
I40SP = imnoise(rgb2gray(imread('Lenna_(test_image).png')),"salt & pepper",0.4);

I5Gauss = imnoise(rgb2gray(imread('Lenna_(test_image).png')),"gaussian",0.05);
I15Gauss = imnoise(rgb2gray(imread('Lenna_(test_image).png')),"gaussian",0.15);
I40Gauss = imnoise(rgb2gray(imread('Lenna_(test_image).png')),"gaussian",0.4);

n = 3;

I5SP_filtered = medfilt2(I5SP,[n n]);
I15SP_filtered = medfilt2(I15SP,[n n]);
I40SP_filtered = medfilt2(I40SP,[n n]);

I5Gauss_filtered = medfilt2(I5Gauss,[n n]);
I15Gauss_filtered = medfilt2(I15Gauss,[n n]);
I40Gauss_filtered = medfilt2(I40Gauss,[n n]);

montage({I5SP, I15SP, I40SP, I5SP_filtered, I15SP_filtered, I40SP_filtered}, "Size",[2 3]);
figure; montage({I5Gauss, I15Gauss, I40Gauss, I5Gauss_filtered, I15Gauss_filtered, I40Gauss_filtered}, "Size",[2 3]);

%% z wagą
clear all; close all; clc;
I = rgb2gray(imread('Lenna_(test_image).png'));
I = imnoise(I,'salt & pepper', 0.05);
I_fil = I;

mask = [0 1 0; 1 3 1; 0 1 0];
[dx,dy] = size(I);
[dxM,dyM] = size(mask);
N = floor(dxM/2);

Vect = [];

for i=N+1:dy-N
    for j=N+1:dx-N
        Arr = I(i-N:i+N, j-N:j+N);
        Arr_Vect = reshape(Arr,[],1);
    end
end