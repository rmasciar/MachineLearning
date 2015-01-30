function trainSVM(y,x,c,kernelFunc,tol=10^-3,max=5)

	[m,n]=size(x);
	
	% map 0 to -1
	y(y==0)=-1;
	
	% kernel
	linear=x*x'
	gaussian(x1,x2)=exp(((x1-x2)*(x1-x2)')/(2*(sd^2)));
