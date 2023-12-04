%% zad 1
clear all; close all; clc;
I_Color = imread('Lenna_(test_image).png');
I_Gray = rgb2gray(I_Color);
montage({I_Color, I_Gray}, "Size",[2,1]);

%% zad 2
clear all; close all; clc;
Gradient = zeros(256,256);
[dx,dy] = size(Gradient);
for i=1:dy
    for j=1:dx
        Gradient(i,j) = Gradient(i,j) + (j-1);
    end
end
imshow(uint8(Gradient));

%% zad 3
clear all; close all; clc;
I_Color = imread('Lenna_(test_image).png');
I_Gray = rgb2gray(I_Color);
I_Neg_Color = 255 - I_Color;
I_Comp_Color = imcomplement(I_Color);
I_Neg_Gray = 255 - I_Gray;
I_Comp_Grey = imcomplement(I_Gray);
montage({I_Color, I_Neg_Color, I_Comp_Color, I_Gray, I_Neg_Gray, I_Comp_Grey}, "Size",[2 3]);

%% zad 4
clear all; close all; clc;
I_Bin_1 = imread('A01.bmp');
I_Bin_2 = imread('A03.bmp');
I_AND = and(I_Bin_1, I_Bin_2);
I_OR = or(I_Bin_1, I_Bin_2);
I_XOR = xor(I_Bin_1, I_Bin_2);
montage({[I_Bin_1, I_Bin_2], [I_AND, I_OR, I_XOR]}, "Size",[2,1]);

%% zad 5
clear all; close all; clc;
I1 = rgb2gray(imread('im1.png'));
I2 = rgb2gray(imread('im2.png'));
I_Add = I1 + I2;
I_Sub = I1 - I2;
I_Mult = I1 .* I2;
montage({[I1, I2], [I_Add, I_Sub, I_Mult]}, "Size",[2,1]);

%% zad 6
clear all; close all; clc;
I = uint16(rgb2gray(imread('Lenna_(test_image).png')));
[dx,dy] = size(I);
I_Multi = I .* I;
montage({uint8(I), I_Multi}, "Size",[2,1]);