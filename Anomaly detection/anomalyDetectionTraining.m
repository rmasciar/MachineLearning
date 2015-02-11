function [mu sigma f p]=anomalyDetectionTraining(x,multivariate=0)
	
	[m n]=size(x);
	
	mu=mean(x,1);
	sigma=(1/(m-1))*(x-ones(m,1)*mu)'*(x-ones(m,1)*mu);
	
	if multivariate==1
		a=((2*pi)^(-0.5*n))*(det(sigma)^(-0.5));
		f=@(xi)a*exp(-(0.5)*(xi(:)'-mu(:)')*pinv(sigma)*(xi(:)-mu(:)));
		
	else
		f=@(xi)prod(((2*pi*diag(sigma)(:)').^(-0.5)).*exp(-((xi(:)'-mu(:)').^2)./(2*diag(sigma)(:)')));
	end

	p=zeros(m,1);
	for i=1:m
		p(i,1)=f(x(i,:));
	end