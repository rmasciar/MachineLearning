function plotFit(min_x,max_x,mu,sd,theta,degree)
	
	x=[(min_x-15):0.05:(max_x+25)]';
	x_poly=polynomialMap(x,degree);
	x_poly=normalize(x_poly,mu,sd);
	
	h=predict('linear',x_poly,theta);
	plot(x,h,'--','LineWidth',2);
	