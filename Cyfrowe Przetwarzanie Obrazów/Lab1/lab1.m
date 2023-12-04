%% zad 1
clear all; close all; clc;

SlonIMG = imread('slonecznik.jpg');
imshow(SlonIMG);
SlonGray = rgb2gray(SlonIMG);
figure; imshow(SlonGray);

%% zad 2
clear all; close all; clc;

A = zeros(256,256);
A = uint8(A);
imshow(A);

for i=1:256
    A(:,i) = i-1;
end
figure; imshow(A);

%% zad 3
clear all; close all; clc;

ImagePositive = imread('slonecznik.jpg');
ImageNegative = 255 - ImagePositive;
imshow(ImageNegative);

%% zad 4
clear all; close all; clc;

Image1 = imread('A01.bmp');
Image2 = imread('A02.bmp');

ImageAND = and(Image1,Image2);
ImageOR = or(Image1, Image2);
ImageXOR = xor(Image1, Image2);

imshow(Image1);
figure; imshow(Image2);
figure; imshow(ImageAND);
figure; imshow(ImageOR);
figure; imshow(ImageXOR);

%% zad 5
clear all; close all; clc;


Image1 = rgb2gray(imread('Image512_1.png'));
Image2 = rgb2gray(imread('Image512_2.png'));

ImageAdd = Image1 + Image2;
ImageSub = Image1 - Image2;
ImageMulti = Image1 .* Image2;

montage({Image1, Image2}); title('Pierwotne obrazy:');
figure; montage({ImageAdd, ImageSub, ImageMulti}, "Size",[1,3]); title('Operacje bez normalizacji:');

%% zad 6
clear all; close all; clc;