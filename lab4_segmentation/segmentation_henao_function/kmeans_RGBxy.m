%Kmeans RGBxy function
%in = RGB image name , number of clusters
%out = segs variable, colormap segmentation
% Takes a RGB image and do segmetation in n_clusters by kmeans MATLAB
% function taking into account distance between clusters.

function [segs] = kmeans_RGBxy (image_name,n_clusters)

%Reading image

first_read = imread (image_name);
size_im = size(first_read);
total_size= size_im(1)*size_im(2);

%We have RGB space, first we have to reshape the image matrix to apply
%Kmeans

R= first_read (:,:,1);
B= first_read (:,:,2);
G= first_read (:,:,3);
r= reshape (R,total_size,1);
b= reshape (B,total_size,1);
g= reshape (G,total_size,1);

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

M = [r,g,b,coor_x,coor_y];
M = double (M);
kimage= kmeans (M,n_clusters);

%Reshape in a mxn matrix the clasificated vector

segs= reshape (kimage,size_im(1),size_im(2));

%Plot segmentation

image (segs)
colormap colorcube

end
