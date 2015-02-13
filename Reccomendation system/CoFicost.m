function [J dJ]=CoFiCost(Y,R,parameters,lambda,nmovies,nuser,n)
	
	X=reshape(parameters(1:nmovies*n),nmovies,n);
	Theta=reshape(parameters((nmovies*n+1):end),nuser,n);
	
	J=0.5*trace(((X*Theta'-Y).*R)*((X*Theta'-Y).*R)')+0.5*lambda*(sum(sum(X.^2))+sum(sum(Theta.^2)));

	X_grad=((X*Theta'-Y).*R)*Theta+lambda*X;
	Theta_grad=((X*Theta'-Y).*R)'*X+lambda*Theta;
	
	dJ=[X_grad(:); Theta_grad(:)];
