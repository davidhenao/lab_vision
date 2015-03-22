%Kmeans LABxy function
%in = RGB image name , number of clusters
%out = segs variable, colormap segmentation
%Takes a RGB image convert it in LAB space color and do segmetation in
%n_clusters by kmeans MATLAB function taking into account distance between
%clusters.

function [segs] = kmeans_LABxy (image_name,n_clusters)

%Reading image

first_read = imread (image_name);
size_im = size(first_read);
total_size= size_im(1)*size_im(2);

%We have RGB space, first we have to convert image to LAB space and reshape
%the image matrix to apply Kmeans

colorTransform = makecform('srgb2lab');
lab = applycform(first_read, colorTransform);

L= lab (:,:,1);
A= lab (:,:,2);
B= lab (:,:,3);

l= reshape (L,total_size,1);
a= reshape (A,total_size,1);
b= reshape (B,total_size,1);

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

M = [l,a,b,coor_x,coor_y];
M = double (M);
kimage= kmeans (M,n_clusters);

%Reshape in a mxn matrix the clasificated vector

segs= reshape (kimage,size_im(1),size_im(2));

%Plot segmentation

image (segs)
colormap colorcube

end
