function kernel=trainSVM(y,x,c,kernelFunc,tol=10^-3,max=5)

	[m,n]=size(x);
	
	% map 0 to -1
	y(y==0)=-1;
	
	% kernel
	linear=@(x1)x1;
	gaussian=@(x1,x2)exp(((x1-x2)*(x1-x2)')/(2*(sd^2)));
	if strcmp(kernelFunc,'linear')==1
		kernel=linear;
	else kernel=gaussian;
	end;
