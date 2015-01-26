function [J, dJ]=neuralCostF(y,x,theta,network,lambda)
	
	[m n]=size(x);
	labels=min(y):max(y);

	% Forward and backward propagation
	[h DELTA]=neuralPredict(y,x,theta,network);

	% Calculate J wth regularization
	J=0;
	for k=labels
		J=J-(1/m)*((y==k)'*log(h(:,k))+(1-(y==k))'*log(1-h(:,k)));
	end
	
	L=length(network);
	for l=1:(L-1)
		theta0=neuralGetMatrix(theta,network,l);
		LAMBDA=eye(size(theta0,1),size(theta0,1));
		J=J+(lambda/(2*m))*(trace((theta0'*LAMBDA*theta0)(2:end,2:end)));
	end
	
	% Calculate dJ with regularization
	for l=1:(L-1)
		DELTAl=neuralGetMatrix(DELTA,network,l);
		LAMBDA=lambda.*ones(size(DELTAl));
		LAMBDA(:,1)=zeros(size(DELTAl,1),1);
		DELTAl=(1/m).*(DELTAl+LAMBDA.*neuralGetMatrix(theta,network,l));
		DELTA=updateDELTA(DELTA,network,l,DELTAl);
	end
	dJ=DELTA;	
	
	
