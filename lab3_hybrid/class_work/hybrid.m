clear all
clc
cd data
A= imread ('dog.bmp');
fil= fspecial ('gaussian',[30 30],100);
FilA= imfilter (A,fil);
imshow (FilA)

B= imread ('cat.bmp');
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
imshow (v1)

positionVector3 = [0.63, 0.25, 0.25, 0.25];
subplot('Position',positionVector3)
imshow (v2)

positionVector4 = [0.64, 0.1, 0.12, 0.12];
subplot('Position',positionVector4)
imshow (v3)
imwrite (New,'Final_image.png')
cd ..
