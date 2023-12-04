%% zad 1
clear all; close all; clc;

ImNorm = im2gray(imread("Image.png"));
ImSalt5 = imnoise(ImNorm,'salt & pepper', 0.05);
ImSalt15 = imnoise(ImNorm,'salt & pepper', 0.15);
ImSalt40 = imnoise(ImNorm,'salt & pepper', 0.4);
ImGauss5 = imnoise(ImNorm,'gaussian', 0.05);

montage({ImNorm,ImSalt5,ImSalt15,ImSalt40,ImGauss5},"Size",[1,5]); title('Obraz po zaszumieniu:');

%Salt5Filtered = uint8(mediana3x3(ImSalt5));
%Salt15Filtered = uint8(mediana3x3(ImSalt15));
%Salt40Filtered = uint8(mediana3x3(ImSalt40));
%Gauss5Filtered = uint8(mediana3x3(ImGauss5));

%Salt5Filtered5 = uint8(mediana5x5(ImSalt5));
%Salt15Filtered5 = uint8(mediana5x5(ImSalt15));
%Salt40Filtered5 = uint8(mediana5x5(ImSalt40));
%Gauss5Filtered5 = uint8(mediana5x5(ImGauss5));

%Salt5Filtered7 = uint8(mediana7x7(ImSalt5));
%Salt15Filtered7 = uint8(mediana7x7(ImSalt15));
%Salt40Filtered7 = uint8(mediana7x7(ImSalt40));
%Gauss5Filtered7 = uint8(mediana7x7(ImGauss5));

WagMaskek = [1 3 1 3 5 3 1 3 1];

Salt5FilteredWag = uint8(wagMed(ImSalt5,WagMaskek));
Salt15FilteredWag = uint8(wagMed(ImSalt15,WagMaskek));
Salt40FilteredWag = uint8(wagMed(ImSalt40,WagMaskek));
Gauss5Filtered7Wag = uint8(wagMed(ImGauss5,WagMaskek));

%figure; montage({ImNorm,Salt5Filtered,Salt15Filtered,Salt40Filtered,Gauss5Filtered},"Size",[1,5]); title('Obraz po filtracji 3x3:');
%figure; montage({ImNorm,Salt5Filtered5,Salt15Filtered5,Salt40Filtered5,Gauss5Filtered5},"Size",[1,5]); title('Obraz po filtracji 5x5:');
%figure; montage({ImNorm,Salt5Filtered7,Salt15Filtered7,Salt40Filtered7,Gauss5Filtered7},"Size",[1,5]); title('Obraz po filtracji 7x7:');
figure; montage({ImNorm,Salt5FilteredWag,Salt15FilteredWag,Salt40FilteredWag,Gauss5Filtered7Wag},"Size",[1,5]); title('Obraz po filtracji 3x3 z wagami:');

%% test
for a = -1:1
    a
end