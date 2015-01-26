function [g,dg]=sigmoid(z)
	g=1./(1+exp(-z));
	dg=g.*(1-g);