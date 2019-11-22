function [acc,gmean,f1] = accuracy(testdata, testlabel, w, b)
%计算精确度
test_m=size(testdata,1);
predictlabel=zeros(test_m,1);
TPandTN = 0;
P = 0;
N = 0;
TP = 0;
FN = 0;
TN = 0;
FP = 0;
    for j=1:test_m
        predictlabel(j)=sign(testdata(j,:)*w+b);
        if predictlabel(j) == testlabel(j);
            TPandTN = TPandTN +1;
        end
        if testlabel(j) == 1
            P = P+1;
            if predictlabel(j) == 1
                TP = TP+1;
            else
                FN = FN+1;
            end
        else
            N = N+1;
            if predictlabel(j) == -1
                TN = TN+1;
            else
                FP = FP+1;
            end
        end 
    end
    acc = TPandTN/test_m;
    P;
    N;
    TP;
    TN;
    FP;
    FN;
    pre = TP/(TP+FP);
    recall = TP/(TP+FN);
    spec = TN/(TN+FP);
    gmean = (recall*spec)^0.5;
    f1 = 2*pre*recall/(pre+recall);
    %acc=1-(norm(1/2*(predictlabel-testlabel))^2)/test_m;
    
end