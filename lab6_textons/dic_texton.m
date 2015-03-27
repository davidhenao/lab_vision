addpath('lib')
clear all
clear memory
close all
clc

% Select a random image of each category.

A= imread('train/T01_01.jpg')/255;
B= imread('train/T02_01.jpg')/255;
C= imread('train/T03_01.jpg')/255;
D= imread('train/T04_01.jpg')/255;
E= imread('train/T05_01.jpg')/255;
F= imread('train/T06_01.jpg')/255;
G= imread('train/T07_01.jpg')/255;
H= imread('train/T08_02.jpg')/255;
I= imread('train/T09_01.jpg')/255;
J= imread('train/T10_07.jpg')/255;
K= imread('train/T11_01.jpg')/255;
L= imread('train/T12_01.jpg')/255;
M= imread('train/T13_03.jpg')/255;
N= imread('train/T14_02.jpg')/255;
O= imread('train/T15_01.jpg')/255;
P= imread('train/T16_01.jpg')/255;
Q= imread('train/T17_01.jpg')/255;
R= imread('train/T18_01.jpg')/255;
S= imread('train/T19_01.jpg')/255;
T= imread('train/T20_01.jpg')/255;
U= imread('train/T21_01.jpg')/255;
V= imread('train/T22_01.jpg')/255;
W= imread('train/T23_01.jpg')/255;
X= imread('train/T24_01.jpg')/255;
Y= imread('train/T25_14.jpg')/255;

% Joint the 25 images.

im = [A B C D E F G H I J K L M N O P Q R S T U V W X Y];

% Creates a filter bank

[fb] = fbCreate;

% Clean variables for memory improvement

clear A;clear B;clear C;clear D;clear E;clear F;clear G;clear H;clear I;
clear J;clear K;clear L;clear M;clear N;clear O;clear P;clear Q;clear R;
clear S;clear T;clear U;clear V;clear W;clear X;clear Y;

% Aplies filter bank to concatenate image

aux= fbRun(fb,im);

% Number of textons in dic

k = 50;

% Clean variables for memory improvement

clear im;
clear memory

% Reshape matrix

d = numel(aux);
n = numel(aux{1});
data = zeros(d,n);
for i = 1:d,
  data(i,:) = aux{i}(:)';
end

% Clean variables for memory improvement

clear aux;clear d; clear i;
clear memory

% Randsample for memory requirements

index = randsample (n,6000);
data = data (:,index);

% Save data

save ('first_dic_text.mat','data','fb','k');

clear memory

%[map,textons] = computeTextons(fbRun(fb,im),k);


