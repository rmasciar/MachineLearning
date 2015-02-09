
function centroids=initializeCentroids(x,K)
	[m n]=size(x);
	centroids=x(randperm(m)(1:K),:);
