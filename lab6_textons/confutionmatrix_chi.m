% Cleaning

clear all
close all
clc

load 'final_names.mat'
cd test
D=dir('*.jpg');
cd ..

%Real categories.

real_cat = cell (1,250);
for i= 1:250
real_cat{i}= D(i).name(1:3);
end

cd train
Dic=dir('*.jpg');
cd ..

%Result of categories chi sq.

resul_cat = cell (1,250);
for i= 1:250
resul_cat{i} = Dic(ind(i)).name(1:3);
end

%2 number in order to do confusion matrix

real_cat_n = zeros (1,250);
for i=1:250
real_cat_n(i)= str2num (real_cat{i}(2:3));
end

resul_cat_n = zeros (1,250);
for i=1:250
resul_cat_n(i)= str2num (resul_cat{i}(2:3));
end

% Confusion matrix

M_c = zeros (25,25);

[M_c,order]= confusionmat (real_cat_n,resul_cat_n);

% Average diagonal of confusion matrix

dia_Mc= diag(M_c);
eval= mean (dia_Mc)

save ('confusion_chi.mat','M_c','eval')