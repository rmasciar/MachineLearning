<<<<<<< HEAD
function similarity=gaussianKernel(xi,l,sigma)
	
	[m n]=size(l);
	
	%xi=xi(:);
	xi_broad=ones(m,1)*xi;
	delta=xi_broad-l;
	similarity=exp(-diag((delta)*(delta)')./(2*(sigma^2)));
	
=======
function similarity=gaussianKernel(xi,l,sigma)
	
	[m n]=size(l);

	delta=ones(m,1)*xi-l;
	similarity=exp(-(1/(2*sigma^2)).*diag(delta*delta'));
>>>>>>> a0988e0ed6a6a5735d62c71c925bbc9b4b2d6b93
