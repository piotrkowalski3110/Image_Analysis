%% zad 1 A
clear all; close all; clc;

imNormal = imread('slonecznik.jpg');
imGray = rgb2gray(imread('slonecznik.jpg'));

normal90 = imrotate(imNormal, -90);
normal180 = imrotate(imNormal, -180);
normal270 = imrotate(imNormal, -270);

gray90 = imrotate(imGray, -90);
gray180 = imrotate(imGray, -180);
gray270 = imrotate(imGray, -270);

montage({imNormal, normal90, normal180, normal270},"Size",[1,4]); title('Pierwszy oraz i obroty:');
figure; montage({imGray, gray90, gray180, gray270},"Size",[1,4]); title('Drugi obraz i obroty:');

%% zad 1 B
clear all; close all; clc;

imNormal = imread('slonecznik.jpg');
imGray = rgb2gray(imread('slonecznik.jpg'));

imNormal90 = pagetranspose(imNormal);
imGray90 = transpose(imGray);

imNormal180 = imNormal(end:-1 : 1, end:-1 : 1, 1 : end);
imGray180 = imGray(end:-1 : 1, end:-1 : 1);

imNormal270 = pagetranspose(imNormal180);
imGray270 = transpose(imGray180);

montage({imNormal, imNormal90, imNormal180, imNormal270},"Size",[1,4]); title('Pierwszy oraz i własne obroty:');
figure; montage({imGray, imGray90, imGray180, imGray270},"Size",[1,4]); title('Drugi obraz i własne obroty:');

%% zad 2
clear all; close all; clc;

imNormal = imread('slonecznik.jpg');
imGray = rgb2gray(imread('slonecznik.jpg'));

% ImNormVert = flip(imNormal, 2);
% ImNormHor = flip(imNormal, 1);
% ImGrayVert = flip(imGray, 2);
% ImGrayHor = flip(imGray, 1);

ImNormVert = imNormal(:,end:-1:1,:);
ImNormHor = imNormal(end:-1:1,:,:);
ImGrayVert = imGray(:,end:-1:1,:);
ImGrayHor = imGray(end:-1:1,:,:);

montage({imNormal, ImNormVert, ImNormHor},"Size",[1,3]); title('Pierwszy oraz i lustrzane odbicia:');
figure; montage({imGray, ImGrayVert, ImGrayHor},"Size",[1,3]); title('Drugi obraz i lustrzane odbicia:');
%% zad 3
clear all; close all; clc;

im1 = im2double(imread('Image512_1.png'));
x = size(im1,1);
y = size(im1,2);
Black = zeros(x*3,y*3, 3);

for i=1:512
    for j=1:512
        Black(i+512,j+512,:) = im1(i,j,:);
    end
end

imshow(Black);
%% zad 4
clear all; close all; clc;

im1 = im2double(imread('Image512_1.png'));
x = size(im1,1);
y = size(im1,2);
Black = zeros(x*3,y*3, 3);

for i=1:512
    for j=1:512
        Black(i+(512+35),j+(512-20),:) = im1(i,j,:);
    end
end

imshow(Black);
%% zad 5
clear all; close all; clc;

IMG = imread('slonecznik.jpg');
IMGnew = IMG(end:-1:1,end:-1:1,:);
imshow(IMGnew);

%% zad 6
clear all; close all; clc;

im1 = imread("Image512_1.png");
im2 = imread("Image512_2.png");

ImAddObc = uint8(im1(:,:,:) + im2(:,:,:));
ImSubObc = uint8(im1(:,:,:) - im2(:,:,:));
ImMultiObc = uint8(im1(:,:,:) .* im2(:,:,:));

im1Double = imread("Image512_1.png");
im1Double = im2double(im1Double);
im2Double = imread("Image512_2.png");
im2Double = im2double(im2Double);

ImAddDouble = im1Double(:,:,:) + im2Double(:,:,:);
ImSubDouble = im1Double(:,:,:) - im2Double(:,:,:);
ImMultiDouble = im1Double(:,:,:) .* im2Double(:,:,:);

ImAddDouble(ImAddDouble > 1) = 1;
ImAddDouble(ImAddDouble < 0) = 0;

ImSubDouble(ImSubDouble > 1) = 1;
ImSubDouble(ImSubDouble < 0) = 0;

ImMultiDouble(ImMultiDouble > 1) = 1;
ImMultiDouble(ImMultiDouble < 0) = 0;

montage({[im1, im2], [ImAddObc, ImSubObc, ImMultiObc]},"Size",[2,1]); title('Obrazy z normalizacją:');
figure; montage({[im1, im2], [ImAddDouble, ImSubDouble, ImMultiDouble]},"Size",[2,1]); title('Obrazy po obcieciu:');