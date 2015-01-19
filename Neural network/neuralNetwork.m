function [optTheta,network]=neuralNetwork(y,x,hidden,lambda=0.1,MaxIter=10)

	m=size(y,1);
	K=size(y,2);
	n=size(x,2);

	network=[n;hidden(:);K];

	% advanced optimization
	options=optimset('GradObj','on','MaxIter','100');
	initialTheta=initTheta(network);
	
	[optTheta,functionVal,exitFlag,o]=fminunc(@(theta)(neuralCost(y,x,theta,lambda,network)),initialTheta,options);
	functionVal
	exitFlag
	o
	