%GMM LAB function
%in = RGB image name , number of clusters
%out = segs variable, colormap segmentation
% Takes a RGB image convert it to LAB color space and applies segmetation
% in n_clusters by GMM MATLAB function.

function [segs] = GMM_LAB (image_name,n_clusters)

%Reading image

first_read = imread (image_name);
size_im = size(first_read);

%We have RGB space, first we have to convert to LAB color space and reshape
%the image matrix to apply GMM.

colorTransform = makecform('srgb2lab');
lab = applycform(first_read, colorTransform);

L= lab (:,:,1);
A= lab (:,:,2);
B= lab (:,:,3);

l= reshape (L,size_im(1)*size_im(2),1);
a= reshape (A,size_im(1)*size_im(2),1);
b= reshape (B,size_im(1)*size_im(2),1);

%New reshape Matrix 3xn*m

M = [l,a,b];

%GMM MATLAB function

M = double (M);
kimage= fitgmdist(M,n_clusters,'Regularize',0.001);
idx = cluster(kimage,M);

%Reshape the clasificated vector

segs= reshape (idx,size_im(1),size_im(2));

%Plot segmentation

image (segs)
colormap colorcube