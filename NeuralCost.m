function [J]=NeuralCost(y,h,theta,nodes,lambda=1)
	[m,K]=size(y);
	L=length(nodes);
	
	J=0;
	for k=1:K
		J=J+(-1/m)*(y(:,k)'*log(h(:,k))+(1-y(:,k))'*log(1-h(:,k)));
	end
	
	for l=1:L
		theta0=getTheta(theta,nodes,l)
		J=J+lambda/(2*m)*trace((theta0'*theta0)(2:end,2:end));
	end

