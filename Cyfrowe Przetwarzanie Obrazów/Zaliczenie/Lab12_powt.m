%% zad 1A
clear all; close all; clc;
I = imread('A03.bmp');
I_ero = I;
[dx, dy] = size(I);

for i=2:dx-1
    for j=2:dy-1
        Arr = I(i-1:i+1, j-1:j+1);
        Check = sum(sum(Arr));
        if Check ~= 9
            I_ero(i,j) = 0;
        end
    end
end
montage({I, I_ero},"Size",[1 2]);

%% zad 1B
clear all; close all; clc;
I = imread('A03.bmp');
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
montage({I, I_dyl},"Size",[1 2]);

%% zad 2A
clear all; close all; clc;
I = imread('A03.bmp');
I_ero = I;
[dx, dy] = size(I);

for i=2:dx-1
    for j=2:dy-1
        Arr = I(i-1:i+1, j-1:j+1);
        Check = sum(sum(Arr));
        if Check ~= 9
            I_ero(i,j) = 0;
        end
    end
end

I_Open = I_ero;

for i=2:dx-1
    for j=2:dy-1
        Arr = I_ero(i-1:i+1, j-1:j+1);
        Check = sum(sum(Arr));
        if Check ~= 0
            I_Open(i,j) = 1;
        end
    end
end
montage({I, I_Open},"Size",[1 2]);

%% zad 2B
clear all; close all; clc;
I = imread('A03.bmp');
I_ero = I;
[dx, dy] = size(I);

for i=2:dx-1
    for j=2:dy-1
        Arr = I(i-1:i+1, j-1:j+1);
        Check = sum(sum(Arr));
        if Check ~= 0
            I_ero(i,j) = 1;
        end
    end
end

I_Open = I_ero;

for i=2:dx-1
    for j=2:dy-1
        Arr = I_ero(i-1:i+1, j-1:j+1);
        Check = sum(sum(Arr));
        if Check ~= 9
            I_Open(i,j) = 0;
        end
    end
end
montage({I, I_Open},"Size",[1 2]);

%% zad 3
clear all; close all; clc;
I = imread('A03.bmp');
I_edge = I;
[dx, dy] = size(I);

for i=2:dx-1
    for j=2:dy-1
        Arr = I(i-1:i+1, j-1:j+1);
        Check = sum(sum(Arr));
        if Check == 9
            I_edge(i,j) = 0;
        end
    end
end
montage({I, I_edge},"Size",[1 2]);

%% zad 4
clear all; close all; clc;
I = imread('A03.bmp');
I_ero = I;
[dx, dy] = size(I);

for i=2:dx-1
    for j=2:dy-1
        Arr = I(i-1:i+1, j-1:j+1);
        Check = sum(sum(Arr));
        if Check ~= 9
            I_ero(i,j) = 0;
        end
    end
end
I_dyl = I;
for i=2:dx-1
    for j=2:dy-1
        Arr = I(i-1:i+1, j-1:j+1);
        Check = sum(sum(Arr));
        if Check ~= 0
            I_dyl(i,j) = 1;
        end
    end
end
ImGrad = I_dyl - I_ero;
imshow(ImGrad);

%%