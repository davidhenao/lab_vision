
% Cleaning

clear all
close all
clc

% Change directory to images directory and extract the names off all files.
tic
cd test;
list = dir;

% Stores the images names in a cell array

C = cell (1,200);
for i= 1:length (list)-3
C{i}= list(i+2).name;
end

% Segmentation of n test image by Kmeans
cd ..
n_clusters=2;
segs = cell (1,5);
n_images = 200;

for j = 1:n_images
    image_name= strcat ('test/',C{j});
    for i= 1:5
        segs {i} = henao_segment_clustering (image_name,'rgb', 'kmeans',n_clusters); 
        n_clusters=n_clusters+2;
    end
    n_clusters=2;
    save (strcat (C{j}(1:end-3),'mat'),'segs')
end

% Move .mat files in a new directory kmeans

mkdir ('kmeans')
for i = 1:n_images
    movefile (strcat (C{i}(1:end-3),'mat'),'kmeans')
end

% Segmentation of n test image by GMM
n_clusters=2;
segs = cell (1,5);

for j = 1:n_images
    image_name= strcat ('test/',C{j});
    for i= 1:5
        segs {i} = henao_segment_clustering (image_name,'rgb', 'gmm',n_clusters); 
        n_clusters=n_clusters+2;
    end
    n_clusters=2;
    save (strcat (C{j}(1:end-3),'mat'),'segs')
end

% Move .mat files in a new directory gmm

mkdir ('gmm')
for i = 1:n_images
    movefile (strcat (C{i}(1:end-3),'mat'),'gmm')
end

tiem= toc

