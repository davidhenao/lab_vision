%Kmeans HSV function
%in = RGB image name , number of clusters
%out = segs variable, colormap segmentation
% Takes a RGB image convert it to HSV color space and applies segmetation
% in n_clusters by kmeans MATLAB function.

function [segs] = kmeans_HSV (image_name,n_clusters)

%Reading image

first_read = imread (image_name);
size_im = size(first_read);

%We have RGB space, first we have to convert to HSV space and reshape the
%image matrix to apply Kmeans

hsv = rgb2hsv(first_read);

H= hsv (:,:,1);
S= hsv (:,:,2);
V= hsv (:,:,3);

h= reshape (H,size_im(1)*size_im(2),1);
s= reshape (S,size_im(1)*size_im(2),1);
v= reshape (V,size_im(1)*size_im(2),1);

%New reshape Matrix 3xn*m

M = [h,v,s];
M = double (M);
kimage= kmeans (M,n_clusters);

%Reshape in a mxn matrix the clasificated vector

segs= reshape (kimage,size_im(1),size_im(2));

%Plot segmentation

image (segs)
colormap colorcube

end


