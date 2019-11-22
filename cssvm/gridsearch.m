function [max_acc ,max_gmean,max_f1]=gridsearch(sample, k)

target_c1=10;
target_c2=15;
target_c3=2;
c1_gap = 1;
c2_gap = 1;
c3_gap = 1;

C1=0;
C2=0;
C3=0;

numOfX=6;
numOfC3=4;
for i=1:numOfX
    C1(i)=target_c1+c1_gap*(i-numOfX/2);
    C2(i)=target_c2+c2_gap*(i-numOfX/2);
end
for i=1:numOfC3
    C3(i)=target_c3+c3_gap*(i-numOfC3/2);
end
C1
C2
C3
% Best_acc_c1=0;
% Best_acc_c2=0;
% Best_acc_c3=0;

max_acc=0;
max_gmean=0;
max_f1=0;

for c1 = C1
    for c2 = C2
        for c3 = C3
            [mean_accuracy , mean_gmean,mean_f1] = Crossvalidation(sample,k,c1,c2,c3);
            if mean_accuracy>max_acc
                max_acc=mean_accuracy
            end
            if mean_gmean>max_gmean
                max_gmean=mean_gmean
            end
            if mean_f1>max_f1
                max_f1=mean_f1
            end
        end
    end
end
