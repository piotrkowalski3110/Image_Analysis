%% Szarość
clear all; close all; clc;
I_Col = imread('Lenna_(test_image).png');
I_Gray = rgb2gray(I_Col);
montage({I_Col, I_Gray}, "Size", [1 2]);

%% Macierz gradient
clear all; close all; clc;
Mac = zeros(256,256);
for i=1:256
    for j=2:256
        Mac_second(i,j) = Mac(i,j)+(j-1);
    end
end
montage({Mac, uint8(Mac_second)}, "Size", [2 1]);

%% Negatyw
clear all; close all; clc;
I_Col = imread('Lenna_(test_image).png');
I_Neg = 255 - I_Col;
montage({I_Col, I_Neg}, "Size", [1 2]);

%% Operacje binarne na obrazach binarnych
clear all; close all; clc;
I1 = imread("A01.bmp");
I2 = imread("A03.bmp");
I_And = and(I1, I2);
I_Or = or(I1, I2);
I_Xor = xor(I1, I2);
montage({I1, I2, [I_And,I_Or,I_Xor]}, "Size", [3 1]);

%% operacje arytmetyczne na obrazach
clear all; close all; clc;
I1 = double(rgb2gray(imread("im1.png")));
I2 = double(rgb2gray(imread("im2.png")));
I_Add = I1 + I2;
I_Sub = I1 - I2;
I_Multi = I1 .* I2;
I_Add_Cut = zeros(256,256);
I_Sub_Cut = zeros(256,256);
I_Multi_Cut = zeros(256,256);
for i=1:512
    for j=1:512
        if I_Add(i,j) < 0
            I_Add_Cut(i,j) = 0;
        elseif I_Add(i,j) > 255
            I_Add_Cut(i,j) = 255;
        else
            I_Add_Cut(i,j) = I_Add(i,j);
        end
        if I_Sub(i,j) < 0
            I_Sub_Cut(i,j) = 0;
        elseif I_Sub(i,j) > 255
            I_Sub_Cut(i,j) = 255;
        else
            I_Sub_Cut(i,j) = I_Sub(i,j);
        end
        if I_Multi(i,j) < 0
            I_Multi_Cut(i,j) = 0;
        elseif I_Multi(i,j) > 255
            I_Multi_Cut(i,j) = 255;
        else
            I_Multi_Cut(i,j) = I_Multi(i,j);
        end
    end
end
I_Add_Normal = uint8(I_Add);
I_Sub_Normal = uint8(I_Sub);
I_Multi_Normal = uint8(I_Multi);
montage({[I_Add,I_Sub,I_Multi], [I_Add_Cut, I_Sub_Cut, I_Multi_Cut], [I_Add_Normal, I_Sub_Normal, I_Multi_Normal]}, "Size", [3 1]);

%% mnożenie obrazu przez samego siebie z normalizacją
clear all; close all; clc;
I = rgb2gray(imread('Lenna_(test_image).png'));
I_Multi = I .* I;
montage({I, uint8(I_Multi)}, "Size", [2 1]);

%% obracanie
clear all; close all; clc;
I_Col = imread('Lenna_(test_image).png');
I_Gray = rgb2gray(I_Col);
I_Col_90 = imrotate(I_Col, 90);
I_Gray_90 = imrotate(I_Gray, 90);
I_Col_180 = imrotate(I_Col, 180);
I_Gray_180 = imrotate(I_Gray, 180);
I_Col_270 = imrotate(I_Col, 270);
I_Gray_270 = imrotate(I_Gray, 270);
imshow(I_Col);
figure; imshow(I_Gray);
figure; imshow(I_Col_90);
figure; imshow(I_Gray_90);
figure; imshow(I_Col_180);
figure; imshow(I_Gray_180);
figure; imshow(I_Col_270);
figure; imshow(I_Gray_270);

%% odbicie lustrzane
clear all; close all; clc;
I_Col = imread('Lenna_(test_image).png');
I_Gray = rgb2gray(I_Col);
I_Col_Flip_Vert = flip(I_Col, 2);
I_Col_Flip_Hor = flip(I_Col, 1);
I_Gray_Flip_Vert = flip(I_Gray, 2);
I_Gray_Flip_Hor = flip(I_Gray, 1);
imshow(I_Col);
figure; imshow(I_Gray);
figure; imshow(I_Col_Flip_Vert);
figure; imshow(I_Col_Flip_Hor);
figure; imshow(I_Gray_Flip_Vert);
figure; imshow(I_Gray_Flip_Hor);

%% centralne ułożenie obrazu na czarnym tle
clear all; close all; clc;
I_Col = imread('Lenna_(test_image).png');
[dx, dy, dz] = size(I_Col);
Black = zeros(dx*3, dy*3, dz);
Black(dx+1:dx*2, dy+1:dy*2, :) = I_Col(1:end, 1:end, :);
imshow(uint8(Black));

%% przesunięcie o wektor
clear all; close all; clc;
I_Col = imread('Lenna_(test_image).png');
[dx, dy, dz] = size(I_Col);
delX = 35;
delY = -20;
Im_Shift = zeros(dx,dy,dz);
Im_Shift(1:end-20, 35:end,:) = I_Col(21:end, 1:end-34, :);
imshow(uint8(Im_Shift));

%% obracanie względem rogu
clear all; close all; clc;
I = imread('Lenna_(test_image).png');
[dx, dy, dz] = size(I);
Black = zeros(dy*2,dx*3,dz);
I_rot = I(end:-1:1,end:-1:1,:);
Black(1:dy, dx*2+1:end,:) = I_rot;
imshow(uint8(Black));

%% skew?
I = imread('Lenna_(test_image).png');
tform = maketform("affine",[1 0 0; 0.1 1 0; 0 0 1]);
J = imtransform(I,tform);
imshow(J)

%% filtr laplace'a gotową
clear all; close all; clc;
I = rgb2gray(imread('Lenna_(test_image).png'));
filterLap = [0 1 0; 1 -4 1; 0 1 0;];
filterGradKieru = [-1 1 1; -1 -2 1; -1 1 1];
I_f = imfilter(I,filterGradKieru);
montage({I, I_f}, "Size", [1 2]);

%% filtr medianowy
clear all; close all; clc;
I = imnoise(rgb2gray(imread('Lenna_(test_image).png')),'salt & pepper',0.2);
I_f = medfilt2(I);

montage({I, I_f}, "Size", [2 1]);