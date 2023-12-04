%% zad 1
clear all; close all; clc;
I = imread("1.bmp");
T = graythresh(I);
I_bin_adapt = imbinarize(I, "adaptive", "Sensitivity",0.7);
I_bin_global = imbinarize(I, T);
montage({I, I_bin_adapt, I_bin_global}, "Size",[3 1]);


%% zad 2
clear all; close all; clc;
mask = ones(3,3);