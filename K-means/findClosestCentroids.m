function clusters=findClosestCentroids(x,centroids)
	[m n]=size(x);
	[c n]=size(centroids);
	clusters=zeros(m,1);
 
	for i=1:m
		delta=(ones(c,1)*x(i,:)-centroids);
		[value pos]=min(diag(delta*delta'));
		clusters(i)=pos;
	end
