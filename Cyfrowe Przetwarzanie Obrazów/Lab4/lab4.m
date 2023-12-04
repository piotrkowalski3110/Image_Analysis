%% zad 1
clear all; close all; clc;
ImNorm = imnoise(im2gray(imread("Image.png")),'salt & pepper', 0.05);

n = 3;
WeightMask = ones(n, n);
[Imx, Imy] = size(ImNorm);

GreaterImage = zeros(Imx+2, Imy+2);
GreaterImage(2:end-1, 2:end-1) = ImNorm(:,:);
GreaterImage(1,2:end-1) = ImNorm(1,:);
GreaterImage(end,2:end-1) = ImNorm(end,:);
GreaterImage(:,1) = GreaterImage(:,2);
GreaterImage(:,end) = GreaterImage(:,end-1);

for i=n:Imx-2
    for j=n:Imy-2
        W = [GreaterImage(i-1,j-1), ImNorm(i,j-1), ImNorm(i+1,j-1);
            GreaterImage(i-1,j), ImNorm(i,j), ImNorm(i+1,j);
            GreaterImage(i-1,j+1), ImNorm(i,j+1), ImNorm(i+1,j+1)];
        W = W .* WeightMask;
        M = sum(WeightMask);
        W = sum(W);
        GreaterImage(i-1,j-1) = W/M;
    end
end

montage({ImNorm, uint8(GreaterImage)},"Size",[1,2]); title('Obraz po filtracji:');