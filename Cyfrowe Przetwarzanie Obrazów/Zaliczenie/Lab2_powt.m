%% zad 1
clear all; close all; clc;
I_Color = imread('Lenna_(test_image).png');
I_Gray = rgb2gray(I_Color);
I_Color_90 = imrotate(I_Color, 90);
I_Color_180 = imrotate(I_Color, 180);
I_Color_270 = imrotate(I_Color, 270);
I_Gray_90 = imrotate(I_Gray, 90);
I_Gray_180 = imrotate(I_Gray, 180);
I_Gray_270 = imrotate(I_Gray, 270);
montage({I_Color_90, I_Color_180, I_Color_270, I_Gray_90, I_Gray_180, I_Gray_270}, "Size",[2,3]);

%% zad 2
clear all; close all; clc;
I_Color = imread('Lenna_(test_image).png');
I_Gray = rgb2gray(I_Color);
I_Col_Flip_Hor = flip(I_Color, 2);
I_Col_Flip_Ver = flip(I_Color, 1);
I_Gray_Flip_Hor = flip(I_Gray, 2);
I_Gray_Flip_Ver = flip(I_Gray, 1);
montage({I_Color, I_Col_Flip_Hor, I_Col_Flip_Ver, I_Gray, I_Gray_Flip_Hor, I_Gray_Flip_Ver}, "Size",[2,3]);

%% zad 3
clear all; close all; clc;
I_Color = imread('Lenna_(test_image).png');
[dx, dy, dz] = size(I_Color);
Black = zeros(dy*3, dx*3, dz);
for i=513:dy*2
    for j=513:dx*2
        Black(i,j,:) = I_Color(i-512, j-512, :);
    end
end
imshow(uint8(Black));

%% zad 4
clear all; close all; clc;
I_Color = imread('Lenna_(test_image).png');
I_shift = imtranslate(I_Color, [35, -20]);
imshow(uint8(I_shift));

%% zad 5
clear all; close all; clc;
I_Color = imread('Lenna_(test_image).png');


%% zad 6
clear all; close all; clc;
I1 = imread('im1.png');
I2 = imread('im2.png');
I1_double = im2double(I1);
I2_double = im2double(I2);

ImAdd = uint8(I1(:,:,:) + I2(:,:,:));
ImSub = uint8(I1(:,:,:) - I2(:,:,:));
ImMulti = uint8(I1(:,:,:) .* I2(:,:,:));

ImAdd2 = double(I1_double(:,:,:) + I2_double(:,:,:));
ImSub2 = double(I1_double(:,:,:) - I2_double(:,:,:));
ImMulti2 = double(I1_double(:,:,:) .* I2_double(:,:,:));

ImAdd2(ImAdd2 > 1) = 1;
ImAdd2(ImAdd2 < 0) = 0;
ImSub2(ImSub2 > 1) = 1;
ImSub2(ImSub2 < 0) = 0;
ImMulti2(ImMulti2 > 1) = 1;
ImMulti2(ImMulti2 < 0) = 0;

montage({ImAdd, ImSub, ImMulti}, "Size",[1,3]);
figure; montage({ImAdd2, ImSub2, ImMulti2}, "Size",[1,3]);