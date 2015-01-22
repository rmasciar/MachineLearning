function [x, mu, sd]=normalize(x0)
	
	[m,n]=size(x0);

	mu=zeros(n,1);
	sd=ones(n,1);


	if sum((x0(:,1)-ones(m,1)).^2)==0;
		j1=2;
		
	else j1=1;
	end

	x=x0;	

	for j=j1:n
		mu(j,1)=mean(x0(:,j));
		sd(j,1)=std(x0(:,j));
		
		if sd(j,1)==0
			sd(j,1)=1;
		end

		x(:,j)=(x0(:,j)-mu(j,1))/sd(j,1);
	end
