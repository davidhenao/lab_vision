%GMM RGB function
%in = RGB image name , number of clusters
%out = segs variable, colormap segmentation
% Takes a RGB image and do segmetation in n_clusters by GMM MATLAB
% function.

function [segs] = GMM_RGB (image_name,n_clusters)

%Reading image

first_read = imread (image_name);
size_im = size(first_read);

%We have RGB space, first we have to reshape the image matrix to apply
%Kmeans

R= first_read (:,:,1);
B= first_read (:,:,2);
G= first_read (:,:,3);

r= reshape (R,size_im(1)*size_im(2),1);
b= reshape (B,size_im(1)*size_im(2),1);
g= reshape (G,size_im(1)*size_im(2),1);

%New reshape Matrix 3xn*m

M = [r,g,b];

%GMM MATLAB function

M = double (M);
kimage= fitgmdist(M,n_clusters,'Regularize',0.001);
idx = cluster(kimage,M);

%Reshape the clasificated vector

segs= reshape (idx,size_im(1),size_im(2));

%Plot segmentation

image (segs)
colormap colorcube