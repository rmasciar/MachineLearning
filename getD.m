function d0=getD(d,nodes,layer)
	L=length(nodes);
	
	st=sum(nodes(1:(layer-1)))+1;
	en=st+nodes(layer)-1;
	d0=d(st:en,1);
