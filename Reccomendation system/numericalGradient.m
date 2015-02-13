function numgrad=numericalGradient(costFunc,parameters)

	numgrad=zeros(size(parameters,1),1);
	perturb=zeros(size(parameters,1),1);
	e=1e-4;

	for p=1:numel(parameters)
		perturb(p)=e;
		plus=costFunc(parameters+perturb);
		minus=costFunc(parameters-perturb);
		numgrad(p)=(plus-minus)/(2*e);
		perturb(p)=0;
	end
	
