function [theta]=update(theta0,alpha,dJ)
	theta=theta0-alpha*dJ;
	
	