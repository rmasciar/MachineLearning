function similarity=gaussianKernel(x1,x2,sigma)
	
	similarity=exp(-trace((x1-x2)'*(x1-x2))/(2*(sigma^2)));

	
