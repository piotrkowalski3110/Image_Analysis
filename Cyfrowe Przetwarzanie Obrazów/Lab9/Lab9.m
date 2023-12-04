%% zad 1
clear all; close all; clc;

for i=1:256
    for j=1:256
        if(j ~= 256)
            macierz(i,j) = j;
        else
            macierz(i,j) = 255;
        end
    end
end

MAC128 = bitand(macierz,254);
MAC64 = bitand(macierz,252);
MAC32 = bitand(macierz,248);
MAC16 = bitand(macierz,240);
MAC8 = bitand(macierz,224);

montage({uint8(macierz), uint8(MAC128), uint8(MAC64), uint8(MAC32), uint8(MAC16), uint8(MAC8)},"Size",[2,3]);

%% zad 2
clear all; close all; clc;

Image = rgb2gray(imread("image.jpg"));
Image128 = bitand(Image,254);
Image64 = bitand(Image,252);
Image32 = bitand(Image,248);
Image16 = bitand(Image,240);
Image8 = bitand(Image,224);

montage({uint8(Image), uint8(Image128), uint8(Image64), uint8(Image32), uint8(Image16), uint8(Image8)},"Size",[2,3]);

%% zad 3
clear all; close all; clc;

ImageRef = imread("B08.bmp");
Image = ImageRef;

Image(:,:,1) = bitand(Image(:,:,1),254);
Image(:,:,2) = bitand(Image(:,:,2),248);
Image(:,:,3) = bitand(Image(:,:,3),240);

montage({ImageRef, Image}, "Size",[2,1]);

%% zad 4

BaseImg = rgb2gray(imread("image.jpg"));
BinImg = imbinarize(BaseImg);

X = 1;
p=1;
pixmax = 1;
tabbled = [];
mask = [0 0 0; 0 X (7/16); (3/16) (5/16) (1/16)];

for i=1:size(BaseImg,1)
    for j=1:size(BaseImg,2)
        if(p<(BaseImg(i,j)+tabbled(i,j)))
            BaseImg(i,j) = 0;
            e = BaseImg(i,j) + tabbled(i,j);
        else
            BaseImg(i,j) = 1;
            e = BaseImg(i,j) + tabbled(i,j) - pixmax;
        end
    end
end