function theta0=getTheta(theta,nodes,layer)
	
	st=sum(nodes(2:(layer-1)).*(nodes(1:(layer-2))+1));
	en=st+nodes(layer).*(nodes(layer-1)+1);
	theta0=reshape(theta(st+1:en)(:),nodes(layer),nodes(layer-1)+1);


