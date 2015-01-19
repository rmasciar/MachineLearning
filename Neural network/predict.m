function h=predict(x,theta,network)

	L=length(network);
	
	a=[1;x(:)];
	for l=2:L
		
		theta_prev=getTheta(theta,network,l-1);
		
		a_prev=getA(a,network,l-1);
				
		z=theta_prev*a_prev;
		if l==L
			a_next=[sigmoid(z)];
		else a_next=[1;sigmoid(z)];
		end
		a=[a;a_next];
	end
	h=getA(a,network,L)';