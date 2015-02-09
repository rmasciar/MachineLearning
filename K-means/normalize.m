function [x_n mu sd]=normalize(x)

	[m n]=size(x);
	
	mu=mean(x,1);

	sd=std(x,[],1);
	sd(sd==0)=1;
	
	x_n=(x-ones(m,1)*mu)./(ones(m,1)*sd);
	
