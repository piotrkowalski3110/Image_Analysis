%% zad 1 bez powiększania
clear all; close all; clc;
I = rgb2gray(imread('Lenna_(test_image).png'));
[dx,dy] = size(I);
I_filtered = I;
N = 7;
mask = ones(N,N);
M = sum(sum(mask));

for i=2:dy-1
    for j=2:dx-1
        Array = I(i-1:i+1, j-1:j+1);
        W = sum(sum(Array));
        Pix = W/M;
        I_filtered(i,j) = Pix;
    end
end
montage({I, I_filtered}, "Size",[1,2]);

%% zad 1 z powiększaniem
clear all; close all; clc;
I = imnoise(rgb2gray(imread('Lenna_(test_image).png')),"gaussian", 0.02);
N = 7;
if mod(N,2)==0
    N = N+1;
end

[dx,dy] = size(I);
addWiersze = floor(N/2);

mask = ones(N,N);
M = sum(sum(mask));

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
        W = sum(sum(Array));
        Pix = W/M;
        filterImg(i,j) = Pix;
    end
end
filteredImg = uint8(filterImg(addWiersze+1:end-addWiersze, addWiersze+1:end-addWiersze));
montage({I, filteredImg}, "Size",[1,2]);

%% zad 4 filtr gaussa
clear all; close all; clc;
I = imnoise(rgb2gray(imread('Lenna_(test_image).png')),"gaussian",0.02);
filter = fspecial('gaussian');
I_fil = imfilter(I,filter);
montage({I, I_fil}, "Size",[1,2]);