function delta0=getDelta(delta,network,l)

	L=length(network);
	
	if l==1
		st=1;
	else st=sum(network(1:(l-1)))+l;
	end

	if l==L
		en=st+network(l)-1;
	else en=st+network(l);
	end

	if l!=L
		delta0=delta((st+1):en);
	else delta0=delta(st:en);
	end