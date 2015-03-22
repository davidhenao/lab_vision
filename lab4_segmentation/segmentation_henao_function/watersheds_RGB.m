%watersheds RGB function
%in = RGB image name , number of división lines
%out = segs variable, colormap segmentation
% Takes a RGB image, converts to double and applies sobel filter to find
% partial derivates df/dx and df/dy. Uses partial derivates to calculae
% gradient. Find and extend the regional minimus and applies the watersheds
% segmetation with watersheds MATLAB function.


function [segs] = watersheds_RGB (image_name,n_clusters)

%Reading image

first_read = imread (image_name);
size_im = size(first_read);
first_readG = rgb2gray (first_read);
first_readG = double (first_readG);

%imfilter: Partial derivates df/dx and df/dy

hx=fspecial('sobel');
hy=hx';

filtered1=imfilter(first_readG,hx);
filtered2=imfilter(first_readG,hy);

%Gradient

gradient=sqrt(filtered1.^2+filtered2.^2);

% Find and extend regional mins

immin= imextendedmin (gradient, n_clusters);
imimpo = imimposemin (gradient,immin);


% Watersheds segmentation

segs_1 = watershed (imimpo);

%Reshape the clasificated vector

segs= reshape (segs_1,size_im(1),size_im(2));

%Plot segmentation

image (segs)
colormap colorcube

end
