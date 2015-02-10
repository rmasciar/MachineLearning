function [x_n mu sd]=normalize(x,mu,sd)

	[m n]=size(x);
	
	if ~exist('mu', 'var') || isempty(mu)
		mu=mean(x,1);
	end

	if ~exist('sd', 'var') || isempty(sd)
		sd=std(x,[],1);
		sd(sd==0)=1;
	end
	
	x_n=(x-ones(m,1)*mu)./(ones(m,1)*sd);
	
