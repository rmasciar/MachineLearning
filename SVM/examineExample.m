examineExample()
	E(j)=b+sum(alpha.*y.*kernel(x(j,:),x))-y(j);
	r=E(j)*y(j);
	if (r<-tol && alpha(j)<C)||(r>tol && alpha(j)>0)
