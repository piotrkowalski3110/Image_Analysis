%% create image
clear all; close all; clc;

I = zeros(8,16);
I(2,3:4) = 1; I(2,11:14) = 1;
I(3,2:6) = 1; I(3,9:13) = 1;
I(4,2:13) = 1;
I(5,2:5) = 1; I(5,8:14) = 1;
I(6,2:4) = 1; I(6,9:12) = 1;
I(7,3:4) = 1; I(7,9:10) = 1;
imwrite(logical(I),'image.bmp');

%% Realizacja
clear all; close all; clc;
I = imread('image.bmp');
I_dyl = I;
[dx, dy] = size(I);

for i=2:dx-1
    for j=2:dy-1
        Arr = I(i-1:i+1, j-1:j+1);
        Check = sum(sum(Arr));
        if Check ~= 0
            I_dyl(i,j) = 1;
        end
    end
end
I_close = I_dyl;
for i=2:dx-1
    for j=2:dy-1
        Arr = I_dyl(i-1:i+1, j-1:j+1);
        Check = sum(sum(Arr));
        if Check ~= 9
            I_close(i,j) = 0;
        end
    end
end
imshow(I);
figure; imshow(I_dyl);
figure; imshow(I_close);

%% translacja macierza
clear all; close all; clc;
I = imread("Lenna_(test_image).png");
trans = [1 0 2; 0 1 3; 0 0 1];
tform = affinetform2d(trans);
I_trans = imwarp(I, tform);
imshow(I_trans);