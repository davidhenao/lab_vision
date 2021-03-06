%GMM LABxy function
%in = RGB image name , number of clusters
%out = segs variable, colormap segmentation
%Takes a RGB image convert it in HSV space color and do segmetation in
%n_clusters by GMM MATLAB function taking into account distance between
%clusters.

function [segs] = GMM_HSVxy (image_name,n_clusters)

%Reading image

first_read = imread (image_name);
size_im = size(first_read);
total_size= size_im(1)*size_im(2);

%We have RGB space, first we have to convert image to HSV space and reshape
%the image matrix to apply GMM

hsv = rgb2hsv(first_read);

H= hsv (:,:,1);
S= hsv (:,:,2);
V= hsv (:,:,3);

h= reshape (H,total_size,1);
s= reshape (S,total_size,1);
v= reshape (V,total_size,1);

%Coordenates

coor_x_p= zeros (size_im(1),size_im(2));
coor_y_p= zeros (size_im(1),size_im(2));

for i=1:size_im(1)
    for j=1:size_im(2)
        coor_x_p(i,j)= i;
        coor_y_p(i,j)= j;
    end
end

coor_x = reshape (coor_x_p,total_size,1);
coor_y = reshape (coor_y_p,total_size,1);

%New reshape Matrix 3xn*m with coordenates

M = [h,s,v,coor_x,coor_y];

% GMM MATLAB function

M = double (M);
kimage= fitgmdist(M,n_clusters,'Regularize',0.001);
idx = cluster(kimage,M);

%Reshape in a mxn matrix the clasificated vector

segs= reshape (idx,size_im(1),size_im(2));

%Plot segmentation

image (segs)
colormap colorcube

end