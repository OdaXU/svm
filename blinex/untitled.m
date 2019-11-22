
name={'Australian_scale'};
path0 = '/Users/Oda/Desktop/data/1VS15/';
filename1= strcat(path0,name{fi},'.mat');
dataset=cell2mat(struct2cell(load(filename1)));
allnumber=size(dataset,1);
P = 0;
N = 0;
for i=1:allnumber
    if dataset(i,1)==1
        P=P+1;
    else
        N=N+1;
    end
end
P;
N;
N/(P+N)