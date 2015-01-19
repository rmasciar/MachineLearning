function theta=neuralNetwork(y,x,hidden,lambda=1)

	m=size(y,1);
	K=size(y,2);
	n=size(x,2);

	network=[n;hidden(:);K];

	theta0=initTheta(network);
	theta=theta0;
	
	[J,dJ]=neuralCost(y,x,theta0,lambda,network)

