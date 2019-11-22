
name={'Australian_scale'};
path0 = '/Users/Oda/Desktop/data/1VS15/';
filename1= strcat(path0,name{fi},'.mat');

a=csvread('/Users/Oda/Desktop/dataset/imb_IRhigherThan9p2/ecoli-0-1_vs_2-3-5/ecoli-0-1_vs_2-3-5.csv')

% allnumber=size(dataset,1);
% P = 0;
% N = 0;
% for i=1:allnumber
%     if dataset(i,1)==1
%         P=P+1;
%     else
%         N=N+1;
%     end
% end
% P;
% N;
% N/(P+N)