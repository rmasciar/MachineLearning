function h=predict(x,theta,network)

	m=size(x,1);
	L=length(network);
	
	for i=1:m
		a=[1;x(i,:)(:)];
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
		if i==1
			h=getA(a,network,L)';
		else h=[h;getA(a,network,L)'];
		end
	end
