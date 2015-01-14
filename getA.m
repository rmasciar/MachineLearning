function [a0]=getA(a,nodes,layer)
	L=length(nodes);
	
	st=sum(nodes(1:(layer-1)))+layer;
	en=st+nodes(layer)-1*(layer==length(nodes));
	a0=a(st:en,1);


