function [J1,J2]=NeuralCost(y,h)
	[m,k]=size(y);
	
	J1=0;
	for i=1:m
		for k=1:K
			J1=J1+(-1/m)*(y(i,k)*log(h(i,k))+(1-y(i,k))*log(1-h(i,k)));
		end
	end

	J2=0;
	for i=1:m
		J2=J2+(-1/m)*(y(i,:)*log(h(i,))+(1-y(i,k))*log(1-h(i,k)));
	end
