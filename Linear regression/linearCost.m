function [J,dJ]=linearCost(y,x,theta,lambda)

	m=size(y,1);
	n=size(x,2);
	
	X=[ones(m,1) x];
	h=predict('linear',X,theta);
	
	LAMBDA=lambda.*eye(n+1,n+1);
	LAMBDA(1,1)=0;
	
	J=(1/(2*m))*((h-y)'*(h-y)+theta'*LAMBDA*theta);
	dJ=(1/m)*(X'*(h-y)+LAMBDA*theta);