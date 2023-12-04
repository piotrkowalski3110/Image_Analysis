%% zad 1
clear all; close all; clc;

Image = imread('Lenna_(test_image).png');
ImageBuiltInYCbCr = rgb2ycbcr(Image);

R = Image(:,:,1);
G = Image(:,:,2);
B = Image(:,:,3);

Y = (0.299 .* R) + (0.587 .* G) + (0.114 .* B);
Cb = 128 - (0.168736 .* R) - (0.331264 .* G) + (0.5 .* B);
Cr = 128 + (0.5 .* R) - (0.418688 .* G) - (0.081312 .* B);

ImageMyYCbCr(:,:,1) = Y;
ImageMyYCbCr(:,:,2) = Cb;
ImageMyYCbCr(:,:,3) = Cr;

montage({Image, ImageBuiltInYCbCr, ImageMyYCbCr}, "Size", [1,3]);

%% zad 2 i 3
clear all; close all; clc;

Image = rgb2ycbcr(imread('Lenna_(test_image).png'));
[dx,dy,dz] = size(Image);

LumTab = [16, 11, 10, 16, 24, 40, 51, 61;
          12, 12, 14, 19, 26, 58, 60, 55;
          14, 13, 16, 24, 40, 57, 69, 56;
          14, 17, 22, 29, 51, 87, 80, 62;
          18, 22, 37, 56, 68, 109, 103, 77;
          24, 35, 55, 64, 81, 104, 113, 92;
          49, 64, 78, 87, 103, 121, 120, 101;
          72, 92, 95, 98, 112, 100, 103, 99];

ChromTab = [17, 18, 24, 47, 99, 99, 99, 99;
            18, 21, 26, 66, 99, 99, 99, 99;
            24, 26, 56, 99, 99, 99, 99, 99;
            47, 66, 99, 99, 99, 99, 99, 99;
            99, 99, 99, 99, 99, 99, 99, 99;
            99, 99, 99, 99, 99, 99, 99, 99;
            99, 99, 99, 99, 99, 99, 99, 99;
            99, 99, 99, 99, 99, 99, 99, 99];

for i=1:8:dy-7
    for j=1:8:dx-7
        for k=1:3
            ImDCT(i:i+7, j:j+7, k) = dct2(Image(i:i+7, j:j+7, k));
        end
    end
end

for i=1:8:dy-7
    for j=1:8:dx-7
        ImDCT(i:i+7, j:j+7, 1) = round(ImDCT(i:i+7, j:j+7, 1) ./ LumTab);
        ImDCT(i:i+7, j:j+7, 2) = round(ImDCT(i:i+7, j:j+7, 2) ./ ChromTab);
        ImDCT(i:i+7, j:j+7, 3) = round(ImDCT(i:i+7, j:j+7, 3) ./ ChromTab);
    end
end

for i=1:8:dy-7
    for j=1:8:dx-7
        ImDCTtoNormal(i:i+7, j:j+7, 1) = round(ImDCT(i:i+7, j:j+7, 1) .* LumTab);
        ImDCTtoNormal(i:i+7, j:j+7, 2) = round(ImDCT(i:i+7, j:j+7, 2) .* ChromTab);
        ImDCTtoNormal(i:i+7, j:j+7, 3) = round(ImDCT(i:i+7, j:j+7, 3) .* ChromTab);
    end
end

for i=1:8:dy-7
    for j=1:8:dx-7
        for k=1:3
            ImDCTtoNormal(i:i+7, j:j+7, k) = idct2(ImDCTtoNormal(i:i+7, j:j+7, k));
        end
    end
end

ImDCTtoNormal = ycbcr2rgb(uint8(ImDCTtoNormal));
Image = ycbcr2rgb(Image);

montage({Image, ImDCT, ImDCTtoNormal}, "Size", [1,3]);

%% zad 4
clear all; close all; clc;