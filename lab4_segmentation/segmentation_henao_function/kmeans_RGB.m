%Kmeans RGB function
%in = RGB image name , number of clusters
%out = segs variable, colormap segmentation
% Takes a RGB image and do segmetation in n_clusters by kmeans MATLAB
% function.

function [segs] = kmeans_RGB (image_name,n_clusters)

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
M = double (M);
kimage= kmeans (M,n_clusters);

%Reshape in a mxn matrix the clasificated vector

segs= reshape (kimage,size_im(1),size_im(2));

%Plot segmentation

image (segs)
colormap colorcube

end


