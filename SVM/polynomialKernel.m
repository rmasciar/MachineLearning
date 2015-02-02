function similarity=polynomialKernel(x1,x2,degree,constant)
	
	similarity=(x1'*x2+constant).^degree;

	
