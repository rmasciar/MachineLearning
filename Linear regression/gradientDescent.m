function [theta,J_history]=gradientDescent(y,x,func,lambda=0.1,alpha=0.01,MaxIter=10^5,epsilon=10^-10)
	
	m=size(y,1);
	n=size(x,2);
	% gradient descent
	theta=zeros(n+1,1);
	J_history=[];
	for iteration=1:MaxIter

		[J,dJ]=func(y,x,theta,lambda);

		% update theta
		theta=theta-alpha.*dJ;
		
		J_history=[J_history;J];
		if iteration>2
			if J_history(iteration-1)-J_history(iteration)<epsilon
				break;
			end
		end
	end