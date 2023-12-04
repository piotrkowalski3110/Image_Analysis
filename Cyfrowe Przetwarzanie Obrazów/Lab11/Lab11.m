%% zad 1
clear all; close all; clc;

ImNorm = rgb2gray(imread('Lenna_(test_image).png'));
ImBinBrad = imbinarize(ImNorm, 'adaptive', Sensitivity=0.45);
ImBinOtsu = imbinarize(ImNorm, 'global');

montage({ImNorm, ImBinBrad, ImBinOtsu},"Size",[1 3]);

%% zad 2
clear all; close all; clc;

ImNorm = rgb2gray(imread('3.bmp'));
ImRef = imread('3_gt.bmp');
lvl = graythresh(ImNorm);

ImOTSU = imbinarize(ImNorm, lvl);
ImBradley = imbinarize(ImNorm, 'adaptive', Sensitivity=0.7);

montage({ImNorm, ImRef, ImOTSU, ImBradley},"Size",[2 2]);

%% zad 3
clear all; close all; clc;

ImNorm = rgb2gray(imread('3.bmp'));
ImNorm = double(ImNorm);
[dx,dy] = size(ImNorm);
NP = dx*dy;
k = -0.2;
m = mean(mean(ImNorm));

for y=2:dy-1
    for x=2:dx-1
        Tab = [power(ImNorm(x-1,y-1),2), power(ImNorm(x-1,y),2), power(ImNorm(x-1,y+1),2);
               power(ImNorm(x,y-1),2), power(ImNorm(x,y),2), power(ImNorm(x,y+1),2);
               power(ImNorm(x+1,y-1),2), power(ImNorm(x+1,y),2), power(ImNorm(x+1,y-1),2)];
        sumPX = sum(sum(Tab));
        pierwiastek = sqrt((sumPX/NP) - power(m,2));
        T(x,y) = m + k * pierwiastek;
    end
end
