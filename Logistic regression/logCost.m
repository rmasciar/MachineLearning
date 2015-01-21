function [J,dJ]=logCost(y,x,theta,lambda)

	m=size(y,1);
	n=size(x,2);
	
	X=[ones(m,1) x];
	
	h=predict('logistic',X,theta);
	
	LAMBDA=lambda.*eye(n+1,n+1);
	LAMBDA(1,1)=0;
	
	J=-(1/m).*(y'*log(h)+(1-y)'*log(1-h))+(1/(2*m)).*theta'*LAMBDA*theta;
	dJ=(1/m).*(X'*(h-y)+LAMBDA*theta);
