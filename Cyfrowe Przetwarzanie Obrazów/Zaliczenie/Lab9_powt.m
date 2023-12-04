%% zad 1
clear all; close all; clc;
for i=1:256
    for j=1:256
        Macierz(i,j) = j-1;
    end
end
Mac128 = bitand(Macierz, bin2dec('11111110'));
Mac64 = bitand(Macierz, bin2dec('11111100'));
Mac32 = bitand(Macierz, bin2dec('11111000'));
Mac16 = bitand(Macierz, bin2dec('11110000'));
Mac8 = bitand(Macierz, bin2dec('11100000'));
montage({uint8(Macierz), uint8(Mac128), uint8(Mac64), uint8(Mac32), uint8(Mac16), uint8(Mac8)},"Size",[2,3]);

%% zad 2
clear all; close all; clc;
I = rgb2gray(imread('Lenna_(test_image).png'));
NewLena = bitand(I, bin2dec('10000000'));
montage({I, NewLena}, "Size",[1 2]);

%% zad 3
clear all; close all; clc;
I = imread('Lenna_(test_image).png');
NewLena = I;
NewLena(:,:,1) = bitand(NewLena(:,:,1),bin2dec('11111000'));
NewLena(:,:,2) = bitand(NewLena(:,:,2),bin2dec('11111110'));
NewLena(:,:,3) = bitand(NewLena(:,:,3),bin2dec('11110000'));
montage({I, NewLena}, "Size",[1 2]);