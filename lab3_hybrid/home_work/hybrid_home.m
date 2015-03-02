clear all
close all
clc

A= imread ('roll_casa.png');
fil= fspecial ('gaussian',[30 30],100);
FilA= imfilter (A,fil);
imshow (FilA)

B= imread ('lob_canon.png');
fil2= fspecial ('gaussian',[30 30],100);
Fil1B= imfilter (B,fil2);
FilB = B-Fil1B;
figure
imshow (FilB)

New = FilA+FilB;
figure
imshow (New)
v1 = impyramid (New,'reduce');
v2 = impyramid (v1,'reduce');
v3 = impyramid (v2,'reduce');
v4 = impyramid (v3,'reduce');

figure
positionVector1 = [0.1, 0.1, 0.5, 1];
subplot('Position',positionVector1)
imshow(New)

positionVector2 = [0.65, 0.5, 0.3, 0.4];
subplot('Position',positionVector2)
imshow (v2)

positionVector3 = [0.63, 0.25, 0.25, 0.25];
subplot('Position',positionVector3)
imshow (v3)

positionVector4 = [0.64, 0.1, 0.12, 0.12];
subplot('Position',positionVector4)
imshow (v4)

imwrite (New,'Final_image.png')

figure
imshow (New)
figure
imshow (v1)
figure
imshow (v2)
figure
imshow (v3)
figure
imshow (v4)