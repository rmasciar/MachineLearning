function [linearKernel polynomialKernel gaussianKernel]=defineKernels(const, degree, sigma)
	
	linearKernel=@(x1,x2)x1*x2';

	polynomialKernel=@(x1,x2)(x1*x2'+const).^degree;
	
	gaussianKernel=@(x1,x2)exp(-((x1-x2)*(x1-x2)')/(2*(sigma^2)));


