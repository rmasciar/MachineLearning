%%%
% kernels

%linear kernel
function K=linearKernel(xi,xj)
	K=xi'*xj;
end

% polyomial kernel
function K=polynomialKernel(xi,xj,constant,degree)
	K=(xi'*xj+constant)^degree;
end

% gaussian kernel
function K=gaussianKernel(xi,xj,sd)
	K=exp(-((xi-xj)'*(xi-xj))/(2*(sd^2)))
end

gaussianKernel([1 2 3],[1 2 3],1)

