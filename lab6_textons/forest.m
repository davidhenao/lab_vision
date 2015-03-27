%Cleaning

clear all
close all
clc

% Load train data
load('bar_train.mat');

% Define train data and labels

tic;

features = zeros (750,50);
for i= 1:750
    features(i,:)= C_train{i}';
end

cd train
Dic=dir('*.jpg');
cd ..
for i=1:750
classLabels(i)=str2num(Dic(i).name (2:3));
end
classLabels = classLabels';

% Define number of trees

n_T= 500;

% Train the decision Forest

Arbol = TreeBagger(n_T, features, classLabels,'Method','classification','OOBPred','On');

% Load test data

load('bar_test.mat')

for i=1:250
    
    arbol_cat(i)  = str2double(Arbol.predict(C_test{i}'));
    
end

time_forest= toc;

%Plot error vs trees

oobErrorBaggedEnsemble = oobError(Arbol);
plot(oobErrorBaggedEnsemble)
xlabel 'Number of grown trees';
ylabel 'Out-of-bag classification error';

cd test
D=dir('*.jpg');
cd ..

%Real categories.

real_cat = cell (1,250);
for i= 1:250
real_cat{i}= D(i).name(1:3);
end

real_cat_n = zeros (1,250);
for i=1:250
real_cat_n(i)= str2num (real_cat{i}(2:3));
end

% Confusion matrix

M_c_a = zeros (25,25);

[M_c_a,order]= confusionmat (real_cat_n,arbol_cat);

% Average diagonal of confusion matrix

dia_Mc= diag(M_c_a);
eval= mean (dia_Mc)

save ('confusion_forest','eval','M_c_a','time_forest')
