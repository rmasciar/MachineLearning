function [h, DELTA]=neuralPredict(y,x,theta,network)
	
	labels=min(y):max(y);
	[m,n]=size(x);
	L=length(network);
	DELTA=0*theta;
	h=[];

	for i=1:m
		% forward
		a=[1;x(i,:)(:)];
		for l=2:L
			a_prev=getA(a,network,l-1); 
			theta_prev=neuralGetMatrix(theta,network,l-1);
			z=theta_prev*a_prev;
			g=sigmoid(z);
			if l==L
				a_next=g;
			else a_next=[1; g];
			end
			a=[a; a_next];

		end
		h=[h; getA(a,network,L)'];

		% backward
		y_vec=zeros(length(labels),1);		
		y_vec(y(i,1),1)=1;
		delta_next=getA(a,network,L)-y_vec;

		for l=(L-1):-1:1

			dg=getA(a,network,l).*(1-getA(a,network,l));

			delta_prev=(neuralGetMatrix(theta,network,l)')*delta_next.*dg;
			delta_prev=delta_prev(2:end);

			DELTAl=neuralGetMatrix(DELTA,network,l);
			DELTAl=DELTAl+delta_next*(getA(a,network,l)');

			DELTA=updateDELTA(DELTA,network,l,DELTAl);

			delta_next=delta_prev;
		end
			
	end
	
