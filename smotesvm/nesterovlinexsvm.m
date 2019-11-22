function [ w , b ] = nesterovlinexsvm( X, Y , c )

[m, dim] = size(X);  
X = [ones(m,1) X];  
w = zeros(dim+1,1);  



learning_rate = 0.01; 
itn = 10000;  
tol = 1e-9 ;    
t = 1;   
vel = zeros(dim+1,1);
r = 0.6; 
d = 0.01;
batch = 100;

error = 1;

while((t <= itn)&&(error>tol))
      rindex = unidrnd(m,batch,1); 
      loss=0;
      w0 = w - r*vel;
      
      %oda
      for i=1:batch
          %cesi = max(0,1-Y(rindex(i))*(X(rindex(i),:)*w0));
          loss1 = -Y(rindex(i))*X(rindex(i),:);
          loss2 = 0;  
          if Y(rindex(i))*(X(rindex(i),:)*w0)<1
              loss2 = 1;
          end
          loss3 = loss1*loss2;
          loss = loss + loss3;
      end


%       for i=1:batch
%           cesi = Y(rindex(i))*(X(rindex(i),:)*w0)-1;
%           loss = loss + Y(rindex(i))*X(rindex(i),:)*(exp(a*cesi)-1);
%       end
      
      gradw = w/m + (c*loss)'/batch;
      vel = r*vel + learning_rate*gradw; 
      w = w - vel;
      learning_rate = learning_rate*exp(-d*t);
      t = t + 1;
     
end
b=w(1);
w=w(2:end);

end