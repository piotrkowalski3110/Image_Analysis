%% zad 1
clear all; close all; clc;
I = rgb2gray(imread('Lenna_(test_image).png'));
mask = [-1 -1 -1; -1 9 2; -1 -1 -1];
N = size(mask,1);
M = sum(sum(mask));
[dx,dy] = size(I);
addWiersze = floor(N/2);

filterImg = zeros(dx+(addWiersze*2),dy+(addWiersze*2));
[dxFil, dyFil] = size(filterImg);
filterImg(addWiersze+1:end-addWiersze, addWiersze+1:end-addWiersze) = I;

for i=1:addWiersze
    filterImg(i, addWiersze+1:end-addWiersze) = I(1,:);
    filterImg(end-(i-1), addWiersze+1:end-addWiersze) = I(end,:);
end
for i=1:addWiersze
    filterImg(:,i) = filterImg(:,addWiersze+1);
    filterImg(:,end-(i-1)) = filterImg(:,end-addWiersze);
end

for i=addWiersze+1:dyFil-addWiersze
    for j=addWiersze+1:dxFil-addWiersze
        Array = filterImg(i-addWiersze:i+addWiersze, j-addWiersze:j+addWiersze);
        Array_Multi = Array .* mask;
        W = sum(sum(Array_Multi));
        Pix = floor(W/M);
        filterImg(i,j) = Pix;
    end
end
filteredImg = filterImg(addWiersze+1:end-addWiersze, addWiersze+1:end-addWiersze);
montage({I, uint8(filteredImg)}, "Size",[1,2]);

%% zad 1 built in
clear all; close all; clc;
%mask = [-1 -1 -1; -1 9 2; -1 -1 -1];
I = rgb2gray(imread('Lenna_(test_image).png'));
I_fil = imfilter(I, mask);
montage({I, uint8(I_fil)}, "Size",[1,2]);

%% filtry splotowe
clear all; close all; clc;
I = rgb2gray(imread('Lenna_(test_image).png'));
mask = [-1 -1 -1; 0 0 0; 1 1 1];
I_fil = conv2(I,mask);
I_fil2 = imfilter(I, mask);
montage({I, uint8(I_fil), uint8(I_fil2)}, "Size",[1,3]);

%% filtr gausa
clear all; close all; clc;
I = imnoise(rgb2gray(imread('Lenna_(test_image).png')),"gaussian",0.05);
fil = fspecial('gaussian',[5 5]);
I_fil = imfilter(I, fil);
montage({I, uint8(I_fil)}, "Size",[2 1]);