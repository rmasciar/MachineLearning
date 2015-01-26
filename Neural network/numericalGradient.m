function numgrad=numericalGradient(y,x,theta,network,lambda)

	epsilon=1e-4;
	perturb=zeros(size(theta));	
	numgrad=zeros(size(theta));
		
	for j=1:length(theta)

		perturb(j)=epsilon;
		J_plus=neuralCostF(y,x,(theta+perturb),network,lambda);
		J_minus=neuralCostF(y,x,(theta-perturb),network,lambda);
		numgrad(j)=(J_plus-J_minus)/(2*epsilon);
		perturb(j)=0;
	end
