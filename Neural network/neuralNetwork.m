function theta=neuralNetwork(y,x,hidden)

	m=size(y,1);
	K=size(y,2);
	n=size(x,2);

	network=[n;hidden(:);K];

	theta0=initTheta(network)
	
	[J,dJ]=neuralCost(y,x,theta0,network)

