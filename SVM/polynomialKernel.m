function similarity=polynomialKernel(x1,x2,constant,degree)
  
   x1=x1(:);
   x2=x2(:);
	
	similarity=(x1'*x2+constant)^degree;

	
