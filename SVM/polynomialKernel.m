function similarity=polynomialKernel(xi,l,const,degree)
	
	xi=xi(:);

	similarity=(l*xi+const).^degree;
	