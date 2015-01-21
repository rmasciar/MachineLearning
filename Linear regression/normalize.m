function x=normalize(x0)
	
	m=size(x0,1);
	n=size(x0,2);

	if x0(:,1)==ones(m,1);
		j1=2;
	else j1=1;
	end

	x=x0;

	for j=j1:n
		x(:,j)=(x0(:,j)-mean(x0(:,j)))/std(x0(:,j));
	end
