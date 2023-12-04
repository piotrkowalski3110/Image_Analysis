%% zad 1 a)
clear all; close all; clc;

ImNorm = im2gray(imread("Image.png"));
[xlab,ylab] = size(ImNorm);
weightMask = [-1 -1 -1; -1 9 2; -1 -1 -1];
ImResult = zeros(512,512);

ImResult(1,1:end) = ImNorm(1,1:end);
ImResult(end,1:end) = ImNorm(end,1:end);
ImResult(1:end,1) = ImNorm(1:end,1);
ImResult(1:end,end) = ImNorm(1:end,end);

for i=2:ylab-1
    for j=2:xlab-1
        W = [ImNorm(i-1, j-1)*weightMask(1,1), ImNorm(i-1, j)*weightMask(1,2), ImNorm(i-1, j+1)*weightMask(1,3);
             ImNorm(i, j-1)*weightMask(2,1), ImNorm(i, j)*weightMask(2,2), ImNorm(i, j+1)*weightMask(2,3);
             ImNorm(i+1, j-1)*weightMask(3,1), ImNorm(i+1, j)*weightMask(3,2), ImNorm(i+1, j+1)*weightMask(3,3)];

        wSum = sum(sum(W));
        maskSum = sum(sum(weightMask));

        ImResult(i,j) = wSum/maskSum;
    end
end

ImBuiltInFun = imfilter(ImNorm, weightMask);

montage({ImNorm, uint8(ImResult), ImBuiltInFun},"Size",[1,3]); title('Obraz po filtracji:');

%% zad 2 a)
clear all; close all; clc;

ImNorm = im2gray(imread("Image.png"));
[xlab,ylab] = size(ImNorm);
weightMask = [0, -1, 0; -1, 4, -1; 0, -1, 0];
ImResult = uint8(zeros(512,512));

ImResult(1,1:end) = ImNorm(1,1:end);
ImResult(end,1:end) = ImNorm(end,1:end);
ImResult(1:end,1) = ImNorm(1:end,1);
ImResult(1:end,end) = ImNorm(1:end,end);

for i=2:ylab-1
    for j=2:xlab-1
        W = [ImNorm(i-1, j-1)*weightMask(1,1), ImNorm(i-1, j)*weightMask(1,2), ImNorm(i-1, j+1)*weightMask(1,3);
             ImNorm(i, j-1)*weightMask(2,1), ImNorm(i, j)*weightMask(2,2), ImNorm(i, j+1)*weightMask(2,3);
             ImNorm(i+1, j-1)*weightMask(3,1), ImNorm(i+1, j)*weightMask(3,2), ImNorm(i+1, j+1)*weightMask(3,3)];

        wSum = sum(sum(W));

        if wSum <= 0
            ImResult(i,j) = 0;
        else
            ImResult(i,j) = 255;
        end
    end
end

ImBuiltInFun = imfilter(ImNorm, weightMask);
montage({ImNorm, uint8(ImResult), ImBuiltInFun},"Size",[1,3]); title('Obraz po filtracji:');

%% zad 3 a)
clear all; close all; clc;

ImNorm = im2gray(imread("Image.png"));
[xlab,ylab] = size(ImNorm);
weightMask = [-1 -1 -1; 0 0 0; 1 1 1];
ImResult = zeros(512,512);

ImResult(1,1:end) = ImNorm(1,1:end);
ImResult(end,1:end) = ImNorm(end,1:end);
ImResult(1:end,1) = ImNorm(1:end,1);
ImResult(1:end,end) = ImNorm(1:end,end);

for i=2:ylab-1
    for j=2:xlab-1
        W = [ImNorm(i-1, j-1)*weightMask(1,1), ImNorm(i-1, j)*weightMask(1,2), ImNorm(i-1, j+1)*weightMask(1,3);
             ImNorm(i, j-1)*weightMask(2,1), ImNorm(i, j)*weightMask(2,2), ImNorm(i, j+1)*weightMask(2,3);
             ImNorm(i+1, j-1)*weightMask(3,1), ImNorm(i+1, j)*weightMask(3,2), ImNorm(i+1, j+1)*weightMask(3,3)];

        wSum = sum(sum(W));
        maskSum = sum(sum(weightMask));

        ImResult(i,j) = wSum/maskSum;
    end
end

ImBuiltInFun = imfilter(ImNorm, weightMask);
montage({ImNorm, uint8(ImResult), ImBuiltInFun},"Size",[1,3]); title('Obraz po filtracji:');