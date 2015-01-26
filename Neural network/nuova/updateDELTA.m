function DELTA=updateDELTA(DELTA,network,l,newDELTA)
	
	L=numel(network);
	
	L_in=network(l)+1;
	L_out=network(l+1);
	nelem=L_out*L_in;
	
	if l==1
		st=1;
	else 
		st=1;
		for l0=1:(l-1)
			st=st+network(l0+1)*(network(l0)+1);
		end 
	end	

	en=st+nelem-1;
	DELTA(st:en,1)=newDELTA(:);
	DELTA;
