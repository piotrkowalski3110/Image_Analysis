%% zad 1
clear all; close all; clc;
imNormal = im2double(imread('slonecznik.jpg'));

Awarp = [1.28 0 0; 0 0.86 0; 0 0 1];
tform = affinetform2d(Awarp);
IMwarp = imwarp(imNormal, tform);

montage({[imNormal],[IMwarp]},"Size",[2,1]); title('Obrazy przeskalowane imwarp:');

%% zad 2
clear all; close all; clc;

I = imresize(imread('slonecznik.jpg'),1);
[H, W, ~] = size(I);
phi = -20*pi/180;
sx = 0.4;
sy = 0.4;
x0 = 1;
y0 = 1;

T = [sx*cos(phi), -sx*sin(phi), 0
     sy*sin(phi),  sy*cos(phi), 0
     (W+1)/2-((sx*x0*cos(phi))+(sy*y0*sin(phi))), (H+1)/2+((sx*x0*sin(phi))-(sy*y0*cos(phi))), 1];

tform = affine2d(T);
J = imwarp(I, tform, 'OutputView', imref2d([H*2, W*2]), 'Interp', 'cubic');
figure;imshow(J)

%% zad 3
clear all; close all; clc;
I = imresize(imread('slonecznik.jpg'),1);
[H, W, ~] = size(I);
phi = 12*pi/180;
sx = 0.5;
sy = 0.5;
x0 = floor((W/2));
y0 = floor((H/2));

T = [sx*cos(phi), -sx*sin(phi), 0
     sy*sin(phi),  sy*cos(phi), 0
     (W+1)/2-((sx*x0*cos(phi))+(sy*y0*sin(phi))), (H+1)/2+((sx*x0*sin(phi))-(sy*y0*cos(phi))), 1];

tform = affine2d(T);
J = imwarp(I, tform, 'OutputView', imref2d([H, W]), 'Interp', 'cubic');
figure;imshow(J)

%% zad 4
clear all; close all; clc;
imNormal = imread('slonecznik.jpg');
blackBG = zeros(size(imNormal,1)*3, size(imNormal,2)*3,3);

%% zad 5
clear all; close all; clc;
imNormal = imread('slonecznik.jpg');
blackBG = zeros(size(imNormal,1)*3, size(imNormal,2)*3,3);

%% zad 6
clear all; close all; clc;
imNormal = imread('slonecznik.jpg');
blackBG = zeros(size(imNormal,1)*3, size(imNormal,2)*3,3);
