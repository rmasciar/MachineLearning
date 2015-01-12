function [theta,J]=LinearRegression(y,x,alpha=10^-3,lambda=1,MaxIteration=10^5,epsilon=0)

m=size(y,1);
n=size(x,2);

X=[ones(m,1),x];
theta=zeros(n+1,1);

LAMBDA=lambda*eye(n+1,n+1);
LAMBDA(1,1)=0;

theta=zeros(n+1,1);
J=zeros(MaxIteration,1);

for iteration=1:MaxIteration

	h=X*theta;
	J(iteration,1)=(1/(2*m))*((h-y)'*(h-y)+theta'*LAMBDA*theta);
	dJ=(1/m)*(X'*(h-y)+LAMBDA*theta);
	theta=theta-alpha*dJ;
	
	if iteration>1 
		if J(iteration-1)-J(iteration)<epsilon
			break;
		end
	end
		
end