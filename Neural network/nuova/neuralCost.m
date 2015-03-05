function [J,dJ]=neuralCost(y_vec,X,theta,network,lambda)

	[m,n]=size(X);
	K=size(y_vec,2);
	L=numel(network);
	DELTA=zeros(size(theta));
	h=[];
	for i=1:m

		% forward
		a=[];
		a_next=[X(i,:)(:)];
		for l=1:(L-1)
			a_curr=[1;a_next];
			a=[a;a_curr];
			theta_curr=neuralGetMatrix(theta,network,l);
			a_next=sigmoid(theta_curr*a_curr);
		end
		a=[a;a_next];
		h=[h;a_next'];
	
		% backward
		delta_L=getA(a,network,L)-y_vec(i,:)';
		for l=(L-1):-1:2

			a_curr=getA(a,network,l);
			theta_curr=neuralGetMatrix(theta,network,l);

			delta_l=(theta_curr')*delta_L.*a_curr.*(1-a_curr);
		
			DELTAl=neuralGetMatrix(DELTA,network,l);
			DELTAl=DELTAl+(1/m).*delta_L*(a_curr');
			DELTA=updateDELTA(DELTA,network,l,DELTAl);
			delta_L=delta_l(2:end,1);
		end

		a_curr=getA(a,network,1);
		DELTAl=neuralGetMatrix(DELTA,network,1);
		DELTAl=DELTAl+(1/m).*delta_L*(a_curr');
		DELTA=updateDELTA(DELTA,network,1,DELTAl);

	end
	
	J=0;
%for k=1:K
%	J=J-(1/m)*(y_vec(:,k)'*log(h(:,k))+((1-y_vec(:,k))')*log(1-h(:,k)));
%end

	J=-(1/m)*(trace(y_vec'*log(h))+trace((1-y_vec)'*log(1-h)));
	
%dJ=DELTA;

	if lambda~=0
	
		for l=1:(L-1)
			% regualarization on cost
		%LAMBDAJ=eye(network(l+1));
			theta0=neuralGetMatrix(theta,network,l);
		%J=J+(lambda/(2*m)).*trace((theta0'*LAMBDAJ*theta0)(2:end,2:end));
			J=J+sum((lambda/(2*m)).*(theta0(:,2:end).^2)(:));
	
			% regualarization on gradient
			DELTAl=neuralGetMatrix(DELTA,network,l);
		%LAMBDAdJ=ones(size(DELTAl));
		%LAMBDAdJ(:,1)=zeros(size(LAMBDAdJ,1),1);
	
		%DELTAl=DELTAl+(lambda/m).*LAMBDAdJ.*theta0;
			DELTAl=DELTAl+(lambda/m).*[zeros(size(theta0,1),1),theta0(:,2:end)];
			DELTA=updateDELTA(DELTA,network,l,DELTAl);		
		end

	end

	dJ=DELTA;

