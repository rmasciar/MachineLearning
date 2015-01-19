function DELTA=updateDELTA(DELTA,network,l,newDELTA)
	
	L_in=network(l)+1;
	L_out=network(l+1);

	if l==1
		st=1;
	else st=(network(l-1)+1)*network(l)+1;
	end
	en=st+L_out*L_in-1;
	DELTA(st:en)=newDELTA(:);
	DELTA;