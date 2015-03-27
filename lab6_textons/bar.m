clear all
close all
clc

load ('Final_DIC.mat')
load ('first_dic_text.mat')
addpath('lib');
%[fb] = fbCreate;
cd train
D=dir('*.jpg');
cd ..
C_train = cell (1,numel(D));

for i=1:numel(D),
      
    name= strcat ('train/',D(i).name);
    im2=double(imread(name));
    tmap = assignTextons(fbRun(fb,im2),textons');
    h= histc(tmap(:),1:50);
    C_train{i}= h;
   
end
save ('bar_train.mat','C_train');