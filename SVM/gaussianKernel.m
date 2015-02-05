function similarity=gaussianKernel(x1,x2,sigma)
  
  x1=x1(:);
  x2=x2(:);
  
  similarity=exp(-trace((x1-x2)'*(x1-x2))/(2*(sigma^2)));

	
