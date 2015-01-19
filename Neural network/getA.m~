function A=getA(a,network,l)

	L=length(network);
	
	if l==1
		st=1;
	else st=sum(network(1:(l-1)))+l;
	end

	if l==L
		en=st+network(l)-1;
	else en=st+network(l);
	end

	A=a(st:en);
