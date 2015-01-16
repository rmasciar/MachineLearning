function [J,dJ]=neuralCost(y,x,theta,network)
	
	
	m=size(y,1);
	K=size(y,2);
	n=size(x,2);

	L=length(network);

	a_prev=x(:);
	a=[a_prev];
	for l=2:L
		L_in=network(l-1)+1;
		L_out=network(l);

		if l==2
			st=1
		else st=network(l-2)+1;
		end
		en=st+network(l-1)
		theta_prev=reshape(theta(st:en),L_out,L_in)

		a_prev=[1;a_prev];

		z=theta_prev*a_prev;
		a_next=sigmoid(z);
		a=[a;a_next];
	end
	
	J=0;
	dJ=0;