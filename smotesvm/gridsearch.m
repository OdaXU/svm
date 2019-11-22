function [max_acc ,max_gmean,max_f1]=gridsearch(sample, k)

target_c=300;
c_gap = 10;


C=0;

numOfX=10;
for i=1:numOfX
    C(i)=target_c+c_gap*(i-numOfX/2);
end
C
max_acc=0;
max_gmean=0;
max_f1=0;

for c = C
    [mean_accuracy , mean_gmean,mean_f1] = Crossvalidation(sample,k,c)
    if mean_accuracy>max_acc
        c
    	max_acc=mean_accuracy
    end
    if mean_gmean>max_gmean
        c
    	max_gmean=mean_gmean
    end
    if mean_f1>max_f1
        c
    	max_f1=mean_f1
    end
end

end
