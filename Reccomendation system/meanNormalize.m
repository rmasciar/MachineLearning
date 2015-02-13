function [yn mu]=meanNormalize(y,r)
	
	[m u]=size(y);

	fac=u./sum(r,2);
	mu=mean(y.*r,2);
	mu=mu.*fac;

	yn=y-mu*ones(1,u);
	
