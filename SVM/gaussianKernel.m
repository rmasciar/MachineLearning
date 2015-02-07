function similarity=gaussianKernel(xi,l,sigma)
	
	[m n]=size(l);

	delta=ones(m,1)*xi-l;
	similarity=exp(-(1/(2*sigma^2)).*diag(delta*delta'));
