% Cleaning

clear all
close all
clc

% Classification by chisq histogram comparation

load 'bar_test.mat';
load 'bar_train.mat'
tic;

d = zeros (250,750);

for i = 1:250
    for j= 1:750
        d (i,j) = pdist2(C_train{j}',C_test{i}','chisq');
    end
end

% Find index of minimus

ind = zeros (1,250);

for i = 1:250
    
    d_aux = d(i,:);
    ind (i)= find (d_aux==min(d_aux));

end

cd train
Dic=dir('*.jpg');
cd ..
clasifi = cell(1,250);

for i = 1:250;
if strcmp(Dic(ind(i)).name (1:end-7),'T01')
   clasifi{i}= 'bark1';
else if strcmp(Dic(ind(i)).name (1:end-7),'T02')
        clasifi{i}= 'bark2';
    else if strcmp(Dic(ind(i)).name (1:end-7), 'T03')
            clasifi{i}= 'bark3';
        else if strcmp(Dic(ind(i)).name (1:end-7), 'T04')
                clasifi{i}= 'wood1';
            else if strcmp(Dic(ind(i)).name (1:end-7), 'T05')
                    clasifi{i}= 'wood2';
                else if strcmp(Dic(ind(i)).name (1:end-7), 'T06')
                        clasifi{i}= 'wood3';
                    else if strcmp(Dic(ind(i)).name (1:end-7), 'T07')
                            clasifi{i}= 'water';
                        else if strcmp(Dic(ind(i)).name (1:end-7), 'T08')
                                clasifi{i}= 'granite';
                            else if strcmp(Dic(ind(i)).name (1:end-7), 'T09')
                                    clasifi{i}= 'marble';
                                else if strcmp(Dic(ind(i)).name (1:end-7), 'T10')
                                        clasifi{i}= 'floor1';
                                    else if strcmp(Dic(ind(i)).name (1:end-7), 'T11')
                                            clasifi{i}= 'floor2';
                                        else if strcmp(Dic(ind(i)).name (1:end-7), 'T12')
                                                clasifi{i}= 'pebbles';
                                            else if strcmp(Dic(ind(i)).name (1:end-7), 'T13')
                                                    clasifi{i}= 'wall';
                                                else if strcmp(Dic(ind(i)).name (1:end-7), 'T14')
                                                        clasifi{i}= 'brick1';
                                                    else if strcmp(Dic(ind(i)).name (1:end-7), 'T15')
                                                            clasifi{i}= 'brick2';
                                                        else if strcmp(Dic(ind(i)).name (1:end-7), 'T16')
                                                                clasifi{i}= 'glass1';
                                                            else if strcmp(Dic(ind(i)).name (1:end-7), 'T17')
                                                                    clasifi{i}= 'glass2';
                                                                else if strcmp(Dic(ind(i)).name (1:end-7), 'T18')
                                                                        clasifi{i}= 'carpet1';
                                                                    else if strcmp(Dic(ind(i)).name (1:end-7), 'T19')
                                                                            clasifi{i}= 'carpet2';
                                                                        else if strcmp(Dic(ind(i)).name (1:end-7), 'T20')
                                                                                clasifi{i}= 'upholstery';
                                                                            else if strcmp(Dic(ind(i)).name (1:end-7), 'T21')
                                                                                    clasifi{i}= 'wallpaper';
                                                                                else if strcmp(Dic(ind(i)).name (1:end-7), 'T22')
                                                                                        clasifi{i}= 'fur';
                                                                                    else if strcmp(Dic(ind(i)).name (1:end-7), 'T23')
                                                                                            clasifi{i}= 'knit';
                                                                                        else if strcmp(Dic(ind(i)).name (1:end-7), 'T24')
                                                                                                clasifi{i}= 'corduroy';
                                                                                            else if strcmp(Dic(ind(i)).name (1:end-7), 'T25')
                                                                                                    clasifi{i}= 'plaid';
                                                                                                else
                                                                                                    clasifi{i}='none';
                                                                                                end
                                                                                            end
                                                                                        end
                                                                                    end
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

t_chisq = toc;

save ('final_names.mat','t_chisq','ind','clasifi');
end