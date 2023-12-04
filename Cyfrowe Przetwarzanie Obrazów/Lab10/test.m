% Wczytaj obraz
obraz = imread('Lenna_(test_image).png');

% Przekształć obraz na odcienie szarości, jeśli jest kolorowy
if size(obraz, 3) > 1
    obraz = rgb2gray(obraz);
end

% Oblicz minimalną i maksymalną wartość pikseli w obrazie
min_value = double(min(obraz(:)));
max_value = double(max(obraz(:)));

% Stwórz tablicę LUT do rozciągnięcia histogramu
LUT = linspace(0, 255, max_value - min_value + 1);

% Zastosuj tablicę LUT do obrazu
rozciagniety_obraz = uint8(LUT(double(obraz) - min_value + 1));

% Wyświetl obrazy
subplot(2, 1, 1);
imshow(obraz);
title('Oryginalny obraz');

subplot(2, 1, 2);
imshow(rozciagniety_obraz);
title('Rozciągnięty histogram');

% Opcjonalnie, wyświetl również histogramy obrazów
figure;
subplot(2, 1, 1);
imhist(obraz);
title('Histogram oryginalnego obrazu');

subplot(2, 1, 2);
imhist(rozciagniety_obraz);
title('Rozciągnięty histogram');
