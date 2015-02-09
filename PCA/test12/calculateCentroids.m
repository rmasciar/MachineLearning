function centroids=calculateCentroids(x,clusters,K)

	[m n]=size(x);
	centroids=zeros(K,n);
	for c=1:K
		centroids(c,:)=mean(x(clusters==c,:),1);
	end

	
