clear all
close all
clc

load ('Final_DIC.mat')
addpath('lib');
cd train
D=dir('*.jpg');
cd ..
C_train = cell (1,numel(D));
tic
for i=1:numel(D),
      
    name= strcat ('train/',D(i).name);
    im2=double(imread(name))/255;
    tmap = assignTextons(fbRun(fb,im2),textons');
    h= histc(tmap(:),1:50);
    C_train{i}= h;
   
 end
save ('bar_train.mat','C_train');
time = toc
clear all
close all
clc

load ('final_dic_textons.mat')
addpath('lib');
cd test
D=dir('*.jpg');
cd ..
C_test = cell (1,numel(D));

for i=1:numel(D),
      
    name= strcat ('test/',D(i).name);
    im2=double(imread(name))/255;
    tmap = assignTextons(fbRun(fb,im2),textons');
    h= histc(tmap(:),1:50);
    C_test{i}= h;
   
end
save ('bar_test.mat','C_test');

clear all
close all
clc
