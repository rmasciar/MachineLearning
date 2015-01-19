function [J,dJ]=neuralCost(y,x,theta,lambda,network)
	
	m=size(y,1);
	K=size(y,2);
	n=size(x,2);

	L=length(network);

	DELTA=initDELTA(network);

	for i=1:m
		
		% forward propagation	
	
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
	
		% back propagation
		
		delta_L=getA(a,network,L)-y(i,:)(:);
		delta=[delta_L(:)];
		for l=(L-1):-1:1
			
			[g,dg]=sigmoid(getA(a,network,l));
			if l==L-1
				delta_l=getTheta(theta,network,l)'*delta_L.*dg;
			else
				delta_l=getTheta(theta,network,l)'*delta_L(2:end).*dg;
			end
			delta_L=delta_l;
			delta=[delta_L(:);delta];
		end

		for l=1:(L-1)
			DELTAtemp=getDELTAM(DELTA,network,l)+getDelta(delta,network,l+1)*getA(a,network,l)';
			DELTA=updateDELTA(DELTA,network,l,DELTAtemp);
		end
		
		
	end
	
	
	% cost function
	
	J=0;
	for k=1:K
		J=J-(1/m)*(y(:,k)'*log(h(:,k))+(1-y(:,k))'*log(1-h(:,k)));	
	end
	
	for l=1:(L-1)	
		theta0=getTheta(theta,network,l);
		LAMBDA=(lambda/(2*m)).*eye(size(theta0,1),size(theta0,1));
		J=J+trace((theta0'*LAMBDA*theta0)(2:end,2:end));
	end	
	

	% gradient
	
	for l=1:(L-1)	
		regTerm=getTheta(theta,network,l);
		regTerm=lambda*[zeros(size(regTerm,1),1) regTerm(:,2:end)];
		DELTAtemp=(1/m)*getDELTAM(DELTA,network,l)+regTerm;
		DELTA=updateDELTA(DELTA,network,l,DELTAtemp);
			
	end

	dJ=DELTA;