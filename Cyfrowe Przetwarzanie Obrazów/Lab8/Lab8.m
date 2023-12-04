%% zad 1
clear all; close all; clc;

% wczytanie obrazu
ImNorm = im2gray(imread("image.jpg"));
imshow(ImNorm); title('Obraz normalny');

% rozmiar obrazu
xSize = size(ImNorm,1);
ySize = size(ImNorm,2);

% maska filtr dolnoprzepustowy
maskA = ones(3);
maskLow = fftshift(fft2(maskA,xSize,ySize));

% maska filtr gornoprzepustowy
maskB = [-1 -1 -1; -1 9 -1; -1 -1 -1];
maskHigh = fftshift(fft2(maskB,xSize,ySize));

% maska filtr pasmowo-przepustowy
maskC = [-1 -1 -1; -1 8 -1; -1 -1 -1];
maskPasmo = fftshift(fft2(maskC,xSize,ySize));

% obliczenia
ImFFT = fft2(ImNorm);
figure; imshow(log(abs(ImFFT)),[]); title('FFT');

ImFFTshift = fftshift(ImFFT);
figure; imshow(log(abs(ImFFTshift)),[]); title('ShiftFFT');

ImFFTLowFiltered = ImFFTshift .* maskLow;
ImFFTLowFiltered = fftshift(ImFFTLowFiltered);
figure; imshow(log(abs(ImFFTLowFiltered)),[]); title('Low filter');

ImFFTHighFiltered = ImFFTshift .* maskHigh;
ImFFTHighFiltered = fftshift(ImFFTHighFiltered);
figure; imshow(log(abs(ImFFTHighFiltered)),[]); title('High filter');

ImFFTPasmoFiltered = ImFFTshift .* maskPasmo;
ImFFTPasmoFiltered = fftshift(ImFFTPasmoFiltered);
figure; imshow(log(abs(ImFFTPasmoFiltered)),[]); title('Pasmo filter');

endImgLow = ifft2(ImFFTLowFiltered);
endImgHigh = ifft2(ImFFTHighFiltered);
endImgPasmo = ifft2(ImFFTPasmoFiltered); 

ObrLow = int8(rescale(real(endImgLow),0,255));
ObrHigh = int8(rescale(real(endImgHigh),0,255));
ObrPasmo = int8(rescale(real(endImgPasmo),0,255));

figure; imshow(ObrLow); title('Reverse Low FFT');
figure; imshow(ObrHigh); title('Reverse High FFT');
figure; imshow(ObrPasmo); title('Reverse Pasmo FFT');

%% zad 3
clear all; close all; clc;

% wczytanie obrazu
ImNorm = im2gray(imread("image.jpg"));
imshow(ImNorm); title('Obraz normalny');

% operacje fft
ImFFT = fft2(ImNorm);
ImFFTshift = fftshift(ImFFT);

% rozmiar obrazu
xSize = size(ImNorm,1);
ySize = size(ImNorm,2);

% maska filtr gauss
maskA = fspecial('gaussian');
maskGauss = fftshift(fft2(maskA,xSize,ySize));

% maska filtr laplace
maskB = fspecial('laplacian');
maskLaplacian = fftshift(fft2(maskB,xSize,ySize));

% maska filtr sobel
maskC = fspecial('sobel');
maskSobel = fftshift(fft2(maskC,xSize,ySize));

% filtracja
GaussFiltered = fftshift(ImFFTshift .* maskGauss);
LaplacianFiltered = fftshift(ImFFTshift .* maskLaplacian);
SobelFiltered = fftshift(ImFFTshift .* maskSobel);

ObrGauss = int8(rescale(real(GaussFiltered),0,255));
ObrLaplacian = int8(rescale(real(LaplacianFiltered),0,255));
ObrSobel = int8(rescale(real(SobelFiltered),0,255));

figure; imshow(ObrGauss); title('Gauss');
figure; imshow(ObrLaplacian); title('Laplacian');
figure; imshow(ObrSobel); title('Sobel');