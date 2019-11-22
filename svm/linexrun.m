close all;
clear;
clc;


name={'ecoli-0_vs_1'};
path0 = '/Users/Oda/Desktop/dataset/imb_IRlowerThan9/ecoli-0_vs_1/';

pathsave = '.\results\'; 
fsave = strcat(pathsave,'Pima_scale.mat','.csv');

k=5; 
dataset_num=length(name);
output_title={ 'Best_a', 'Best_c', 'max_acc', 'max_std',  'toc'};
csvwrite(fsave,output_title,1,2);
%csvwrite(fsave,name,2,1);
result=zeros(dataset_num,5);

for fi=1:dataset_num
   
    
    disp(['The current runing dataset is ',name{fi}]);
    filename= strcat(path0,name{fi},'.csv');
    %dataset=cell2mat(struct2cell(load(filename1)));
    dataset=csvread(filename);
    
    rand('state',2);
    allnumber=size(dataset,1);
    s=randperm(allnumber);
    dataset=dataset(s,:);
    

    [max_acc ,max_gmean, max_f1]=gridsearch(dataset, k);
    %tic;
    %[ w ,b] = nesterovlinexsvm( dataset(:,2:end), dataset(:,1) ,Best_a, 2^Best_c,Best_U);
    %toc
    out=[max_acc, max_gmean,max_f1 ]
    %result(fi,:) = out;
    %csvwrite(fsave,result,2,2);
    
    
end
