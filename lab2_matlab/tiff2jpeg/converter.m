%Cleaner workspace and variables.

clear all
close all
clc

%Change directory to images directory and extract the names off all files
%in the current directory.

cd misc;
list = dir;

% Stores the images names in a cell array

for i= 1:length (list)-2
C{i}= list(i+2).name;
end

% Creates a modify vector names with the new extentions.

exte = '.jpeg';
for i= 1:length (C)
Cm{i}= strcat (C{i}(1:end-5),exte);
end

% Convert image_name.tiff to image_name.jpeg

for i= 1:length (C)
a= imread (C{i});
imwrite (a,Cm{i});
end

% Return to the initial directory
cd ..
exit
