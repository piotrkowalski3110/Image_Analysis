%% zad 3
clear all; close all; clc;
I = imread("Lenna_(test_image).png");
I_rot = imrotate(I, 12);
imshow(I_rot);

%% zad 5
clear all; close all; clc;
I = imread("Lenna_(test_image).png");
imshow(I)
A = [1 0 0; 0 1 0; 0 0 1];
tform = affinetform2d(A);
J = imwarp(I,tform);
imshow(J)

%% zad 5
clear all; close all; clc;
I = imread("Lenna_(test_image).png");
imshow(I)
A = [1 0 0; tan(22) 1 0; 0 0 1];
tform = affinetform2d(A);
J = imwarp(I,tform);
imshow(J)

%% zad 1
clear all; close all; clc;
I = imread('Lenna_(test_image).png');
scalar = [1.28 0 0; 0 0.86 0; 0 0 1];
tform = affinetform2d(scalar);
I_res = imwarp(I, tform);
montage({I, I_res},"Size",[1 2]);