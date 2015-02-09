function [clusters,centroids, J_history]=kmeans(x,K)

% initial values
[m n]=size(x);
J_history=[];

% normalize x
[x mu sd]=normalize(x);

% initialize centroids
centroids=initializeCentroids(x,K);
clusters=zeros(m,1);

no_changes=0;

while no_changes==0

	clusters_old=clusters;

	% find closest centroids
	clusters=findClosestCentroids(x,centroids);
	
	% re-compute centroids
	centroids=calculateCentroids(x,clusters,K);

	% control if any change in the clusterization
	if sum(clusters_old==clusters)==m
		no_changes=1;
	end

	% compute cost
	J=0;
	for i=1:m
		J=J+(1/m)*sum((x(i,:)-centroids(clusters(i),:)).^2);
	end
	J_history=[J_history;J];

end
c=size(centroids,1);
centroids=(centroids.*(ones(c,1)*sd))+(ones(c,1)*mu);
