%% zad 1A
clear all; close all; clc;

ImNorm = imread('A03.bmp');
Image = ImNorm;
[dx, dy] = size(ImNorm);

for x=2:dx-1
    for y=2:dy-1
        Point = [ImNorm(x-1,y-1), ImNorm(x-1,y), ImNorm(x-1,y+1);
               ImNorm(x,y-1), ImNorm(x,y), ImNorm(x,y+1);
               ImNorm(x+1,y-1), ImNorm(x+1,y), ImNorm(x+1,y-1)];
        Check = sum(sum(Point));
        if Check ~= 9
            Image(x,y) = 0;
        end
    end
end

montage({ImNorm, Image},"Size",[1 2]);

%% zad 1B
clear all; close all; clc;

ImNorm = imread('A03.bmp');
Image = ImNorm;
[dx, dy] = size(ImNorm);

for x=2:dx-1
    for y=2:dy-1
        Point = [ImNorm(x-1,y-1), ImNorm(x-1,y), ImNorm(x-1,y+1);
               ImNorm(x,y-1), ImNorm(x,y), ImNorm(x,y+1);
               ImNorm(x+1,y-1), ImNorm(x+1,y), ImNorm(x+1,y-1)];
        Check = sum(sum(Point));
        if Check ~= 0
            Image(x,y) = 1;
        end
    end
end

montage({ImNorm, Image},"Size",[1 2]);

%% zad 2A
clear all; close all; clc;

ImNorm = imread('A03.bmp');
ImageEro = ImNorm;
[dx, dy] = size(ImNorm);

for x=2:dx-1
    for y=2:dy-1
        Point = [ImNorm(x-1,y-1), ImNorm(x-1,y), ImNorm(x-1,y+1);
               ImNorm(x,y-1), ImNorm(x,y), ImNorm(x,y+1);
               ImNorm(x+1,y-1), ImNorm(x+1,y), ImNorm(x+1,y-1)];
        Check = sum(sum(Point));
        if Check ~= 9
            ImageEro(x,y) = 0;
        end
    end
end
ImageOpen = ImageEro;
for x=2:dx-1
    for y=2:dy-1
        Point = [ImageEro(x-1,y-1), ImageEro(x-1,y), ImageEro(x-1,y+1);
               ImageEro(x,y-1), ImageEro(x,y), ImageEro(x,y+1);
               ImageEro(x+1,y-1), ImageEro(x+1,y), ImageEro(x+1,y-1)];
        Check = sum(sum(Point));
        if Check ~= 0
            ImageOpen(x,y) = 1;
        end
    end
end

montage({ImNorm, ImageOpen},"Size",[1 2]);

%% zad 2B
clear all; close all; clc;

ImNorm = imread('A03.bmp');
ImageDyl = ImNorm;
[dx, dy] = size(ImNorm);

for x=2:dx-1
    for y=2:dy-1
        Point = [ImNorm(x-1,y-1), ImNorm(x-1,y), ImNorm(x-1,y+1);
               ImNorm(x,y-1), ImNorm(x,y), ImNorm(x,y+1);
               ImNorm(x+1,y-1), ImNorm(x+1,y), ImNorm(x+1,y-1)];
        Check = sum(sum(Point));
        if Check ~= 0
            ImageDyl(x,y) = 1;
        end
    end
end
ImageClose = ImageDyl;
for x=2:dx-1
    for y=2:dy-1
        Point = [ImageDyl(x-1,y-1), ImageDyl(x-1,y), ImageDyl(x-1,y+1);
               ImageDyl(x,y-1), ImageDyl(x,y), ImageDyl(x,y+1);
               ImageDyl(x+1,y-1), ImageDyl(x+1,y), ImageDyl(x+1,y-1)];
        Check = sum(sum(Point));
        if Check ~= 9
            ImageOpen(x,y) = 0;
        end
    end
end

montage({ImNorm, ImageClose},"Size",[1 2]);

%% zad 3
clear all; close all; clc;

ImNorm = imread('A03.bmp');
[dx, dy] = size(ImNorm);
Image = zeros(dx,dy);

for x=2:dx-1
    for y=2:dy-1
        Point = [ImNorm(x-1,y-1), ImNorm(x-1,y), ImNorm(x-1,y+1);
               ImNorm(x,y-1), ImNorm(x,y), ImNorm(x,y+1);
               ImNorm(x+1,y-1), ImNorm(x+1,y), ImNorm(x+1,y-1)];
        Check = sum(sum(Point));
        if Check < 9 && Check > 0
            Image(x,y) = 1;
        end
    end
end

montage({ImNorm, Image},"Size",[1 2]);

%% zad 4
clear all; close all; clc;

ImNorm = imread('A03.bmp');
ImageEro = ImNorm;
ImageDyl = ImNorm;
[dx, dy] = size(ImNorm);

for x=2:dx-1
    for y=2:dy-1
        Point = [ImNorm(x-1,y-1), ImNorm(x-1,y), ImNorm(x-1,y+1);
               ImNorm(x,y-1), ImNorm(x,y), ImNorm(x,y+1);
               ImNorm(x+1,y-1), ImNorm(x+1,y), ImNorm(x+1,y-1)];
        Check = sum(sum(Point));
        if Check ~= 0
            ImageDyl(x,y) = 1;
        end
    end
end
for x=2:dx-1
    for y=2:dy-1
        Point = [ImNorm(x-1,y-1), ImNorm(x-1,y), ImNorm(x-1,y+1);
               ImNorm(x,y-1), ImNorm(x,y), ImNorm(x,y+1);
               ImNorm(x+1,y-1), ImNorm(x+1,y), ImNorm(x+1,y-1)];
        Check = sum(sum(Point));
        if Check ~= 9
            ImageEro(x,y) = 0;
        end
    end
end

ImageGradient = ImageDyl - ImageEro;
montage({ImNorm, ImageEro, ImageDyl, ImageGradient},"Size",[2,2]);

%% zad 5
clear all; close all; clc;

n = 500;

ImNorm = imread('E02.bmp');
ImageDyl = ImNorm;
[dx, dy] = size(ImNorm);
MyImage = zeros(dx,dy);

MyImage(1,1:end) = 1; MyImage(end,1:end) = 1;
MyImage(1:end,1) = 1; MyImage(1:end,end) = 1;

ImAfterBitAnd = bitand(ImNorm,MyImage);

for a=1:n
B = ImAfterBitAnd;
    for x=2:dx-1
        for y=2:dy-1
            Point = [B(x-1,y-1), B(x-1,y), B(x-1,y+1);
                     B(x,y-1), B(x,y), B(x,y+1);
                     B(x+1,y-1), B(x+1,y), B(x+1,y-1)];
            Check = sum(sum(Point));
            if Check ~= 0
                ImAfterBitAnd(x,y) = 1;
            end
        end
    end
    ImAfterBitAnd = bitand(ImAfterBitAnd,ImNorm);
end

ImAfterOperaions = ImNorm - ImAfterBitAnd;
montage({ImNorm, ImAfterBitAnd, ImAfterOperaions}, "Size", [1,3]);