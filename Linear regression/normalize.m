function x=normalize(x0)
	x=x0;
	for j=1:size(x0,2)
		x(:,j)=(x0(:,j)-mean(x0(:,j)))/range(x0(:,j));
	end