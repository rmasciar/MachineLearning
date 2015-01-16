function theta0=initTheta(network)
	
	L=length(network);
	theta0=[];

	for l=2:L
		L_in=network(l-1)+1;
		L_out=network(l);
		epsilon=sqrt(6)/sqrt(L_in+L_out);
		theta=rand(L_out,L_in)*2*epsilon-epsilon;
		theta0=[theta0;theta(:)];
	end