function [x, mu, sd]=normalize(x0, mu,sd)

	[m,n]=size(x0);

	if sum((x0(:,1)-ones(m,1)).^2)==0;
		j1=2;
	else j1=1;
	end

	x=x0;	

	if nargin==1		

		mu=zeros(n,1);
		sd=ones(n,1);

		for j=j1:n
			mu(j,1)=mean(x0(:,j));
			sd(j,1)=std(x0(:,j));
			x(:,j)=(x0(:,j)-mu(j,1))/sd(j,1);
		end

	else

		for j=j1:n
			x(:,j)=(x0(:,j)-mu(j,1))/sd(j,1);
		end

	end