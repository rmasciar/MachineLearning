function similarity=gaussianKernel(xi,l,sigma)
	
	[m n]=size(l);
	
	%xi=xi(:);
	xi_broad=ones(m,1)*xi;
	delta=xi_broad-l;
	similarity=exp(-diag((delta)*(delta)')./(2*(sigma^2)));
	