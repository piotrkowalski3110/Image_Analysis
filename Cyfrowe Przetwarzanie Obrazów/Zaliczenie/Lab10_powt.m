%% zad 1
clear all; close all; clc;
I_Color = imread('Lenna_(test_image).png');
I_Gray = rgb2gray(I_Color);

imhist(I_Gray);
figure; imhist(I_Color(:,:,1));
figure; imhist(I_Color(:,:,2));
figure; imhist(I_Color(:,:,3));

%% zad 2
clear all; close all; clc;
I_Color = imread('Lenna_(test_image).png');
I_Gray = rgb2gray(I_Color);

Hist_Gray = imhist(I_Gray);
Hist_Color = imhist(I_Color);

HGCum = cumsum(Hist_Gray);
HCCum = cumsum(Hist_Color);

bar(HGCum);
figure; bar(HCCum);

%% zad 3
clear all; close all; clc;
I = imread('Lenna_(test_image).png');
X = -100;

for i=1:256
    helper = (i-1)+X;
    if helper < 0
        LUT(i) = 0;
    elseif helper > 255
        LUT(i) = 255;
    else
        LUT(i) = helper;
    end      
end

for x=1:512
    for y=1:512
        I_Shift(x,y,:) = LUT(I(x,y,:));
    end
end
montage({I, uint8(I_Shift)}, "Size",[1 2]);