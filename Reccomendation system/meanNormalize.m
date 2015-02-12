function [yn mu]=meanNormalize(y)
	
	[m u]=size(y);
	mu=mean(y,2);
	yn=y-mu*ones(1,u);
	