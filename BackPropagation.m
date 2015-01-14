function [d]=BackPropagation(y,i,theta,nodes,a)

	L=length(nodes);

	d0=[(getA(a,nodes,L)-y(i,:)')(:)];
	d=[d0(:)];
	for l=(L-1):-1:1
		d1=getTheta(theta,nodes,l)*d0.*getA(a,nodes,l).*(1-getA(a,nodes,l));
		d0=d1[2:end];
		d=[d0(:);d(:)];
	end
	