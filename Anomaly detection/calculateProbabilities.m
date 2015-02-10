function [p,sigma]=calculateProbabilities(x,multivariate=0,mu,sd)

	[m n]=size(x);

	if ~exist('mu', 'var') || isempty(mu)
		% normalize
		[xn mu sd]=normalize(x);
	else
		xn=normalize(x,mu,sd);
	end
	
	% covariance/correlation matrix
	sigma=(1/(m-1))*xn'*xn;
	
	% multivariate gaussian
	if multivariate==1
		p=zeros(m,1);
		for i=1:m
			p(i,:)=((((2*pi)^n)*det(sigma))^(-0.5))*exp(-0.5*(xn(i,:)*pinv(sigma)*xn(i,:)'));
		end
	else	
		p=prod(((2*pi)^(-0.5))*exp(-(xn.^2)/2),2);
	end

	