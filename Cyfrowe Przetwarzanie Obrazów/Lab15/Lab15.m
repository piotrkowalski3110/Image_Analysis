%% Zad 1
clear all; close all; clc;

faceDetector = vision.CascadeObjectDetector;
shapeInserter = vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[0 255 255]);
I = imread('jav3.jpg');
bbox = step(faceDetector, I);
I_faces = step(shapeInserter, I, int32(bbox));
imshow(I_faces), title('Detected faces');

%% zad 2
clear all; close all; clc;

faceDetector = vision.CascadeObjectDetector;
eyeDetector = vision.CascadeObjectDetector('EyePairSmall');
mouthDetector = vision.CascadeObjectDetector('Mouth');

I = imread('jav3.jpg');
bboxFace = faceDetector(I);
IFaces = insertShape(I, 'Rectangle', bboxFace, 'Color', [255 0 0]);
bboxEye = eyeDetector(IFaces);
Ieyes = insertShape(IFaces, 'Rectangle', bboxEye, 'Color', [0 255 0]);
bboxmouth = mouthDetector(IFaces);
Imouth = insertShape(Ieyes, 'Rectangle', bboxmouth, 'Color', [0 0 255]);
figure;
imshow(Imouth);


%% zad 3
clear all; close all; clc;

