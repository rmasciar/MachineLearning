function pred=CoFiPredict(parameters,mu=0,nmovies,nuser,n)

	X=reshape(parameters(1:nmovies*n),nmovies,n);
	Theta=reshape(parameters((nmovies*n+1):end),nuser,n);

	if mu==0
		mu=zeros(nmovies,1);
	end
	
	pred=X*Theta'+mu*ones(1,nuser);