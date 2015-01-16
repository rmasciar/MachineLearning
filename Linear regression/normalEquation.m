function [theta]=normalEquation(y,x,lambda=1)	

	m=size(y,1);
	n=size(x,2);

	LAMBDA=lambda*eye(n+1,n+1);
	LAMBDA(1,1)=0;
	X=[ones(m,1) x];
	theta=pinv(X'*X+LAMBDA)*X'*y;
