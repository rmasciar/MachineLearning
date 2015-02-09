function probs=calculateProbabilities(x)
	
	[xn mu sd]=normalize(x);
	
	p=(1./sqrt(2*pi))*exp(-(xn.^2)/2);
	probs=prod(p,2);