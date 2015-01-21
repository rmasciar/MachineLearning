function theta0=initializeTheta(x)
	
	[m,n]=size(x);
	
	if sum((x(:,1)-ones(m,1)).^2)==0
		n=n-1;
	else n=n;
	end
	
	theta0=zeros(n+1,1);
		