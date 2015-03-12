function [b_complete b_cut]=Haar_basis(x,epsilon,M,m,b_prev=0)
    
    K=numel(epsilon);
    
   tau=[linspace(-0.001*range(x)+min(x),min(x),M) epsilon linspace(max(x),0.001*range(x)+max(x),M)];
    b=zeros(K+2*M-m,numel(x));
    
    for i=1:(K+2*M-m)
  
      if m==1
          b(i,:)=(x>=tau(i+m-1))&(x<tau(i+m));
      else
          b(i,:)=b_prev(i,:).*(x-tau(i))/(tau(i+m-1)-tau(i));
          b(i,:)=b(i,:)+b_prev(i+1,:).*(tau(i+m)-x)/(tau(i+m)-tau(i+1));
      end
      
    end
    b_complete=b;
    b_cut=b((M-m+1):(M+K),:);