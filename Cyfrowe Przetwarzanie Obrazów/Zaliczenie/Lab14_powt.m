%% zad 1
clear all; close all; clc;
I = imread('Lenna_(test_image).png');
I_built = rgb2ycbcr(I);

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

Y = (0.299 .* R) + (0.587 .* G) + (0.114 .* B);
Cb = 128 - (0.168736 .* R) - (0.331264 .* G) + (0.5 .* B);
Cr = 128 + (0.5 .* R) - (0.418688 .* G) - (0.081312 .* B);

IYCbCr(:,:,1) = Y;
IYCbCr(:,:,2) = Cb;
IYCbCr(:,:,3) = Cr;

montage({I, I_built, IYCbCr}, "Size", [1,3]);