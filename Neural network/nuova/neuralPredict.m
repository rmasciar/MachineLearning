function [p performance]=neuralPredict(y_vec,X,theta,network)

	[m,n]=size(X);
	L=numel(network);

	for i=1:m
		a_next=[X(i,:)(:)];
		for l=1:(L-1)
			a_curr=[1;a_next];
			theta_curr=neuralGetMatrix(theta,network,l);
			a_next=sigmoid(theta_curr*a_curr);
		end
		h(i,:)=a_next';
	end
	
	[val p]=max(h,[],2);
	[val yp]=max(y_vec,[],2);
	performance=100*mean(p==yp);