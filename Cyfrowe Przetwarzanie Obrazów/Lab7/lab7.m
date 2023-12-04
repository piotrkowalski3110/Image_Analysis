%% zadanie 1
clear all; close all; clc;
ImNorm = imread("Img2.png");
ImSalt = imnoise(ImNorm,'salt & pepper', 0.05);

for i=2:size(ImNorm,2)-1
    for j=2:size(ImNorm,1)-1
        Standard = {ImNorm(i-1, j-1,:), ImNorm(i-1, j,:), ImNorm(i-1, j+1,:), ImNorm(i, j-1,:), ImNorm(i, j,:), ImNorm(i, j+1,:), ImNorm(i+1, j-1,:), ImNorm(i+1, j,:), ImNorm(i+1, j+1,:)};
        for a=1:9
            for b=1:9
                Odl(b,a) = abs(Standard{a}(1) - Standard{b}(1)) + abs(Standard{a}(2) - Standard{b}(2)) + abs(Standard{a}(3) - Standard{b}(3));
            end
        end
    end
end



%% ishfuisdhuifb
clear all; close all; clc;
ImNorm = imread("Img2.png");
ImSalt = imnoise(ImNorm,'salt & pepper', 0.05);

%Test{1}= ImSalt(1,1,:)
%Test{2} = ImSalt(2,1,:)
%Test{2} - Test{1}

mat = [5 5 5 4 5 6 7 8 9];
%sort(mat)
%mat(3,1)