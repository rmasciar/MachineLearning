function [a,h]=ForwardPropagation(x,i,theta,nodes,lambda=1)
	L=length(nodes)
	a=[1;x(i,:)(:)];

	for l=2:L
		a0=sigmoid(theta*getA(a,nodes,l-1));
		if l<L
			a0=[1;a0];
		end
		a=[a;a0];
	end
	h=a0';
