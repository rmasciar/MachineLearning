function DELTAM=getDELTAM(DELTA,network,l)

	L_in=network(l)+1;
	L_out=network(l+1);

	if l==1
		st=1;
	else st=(network(l-1)+1)*network(l)+1;
	end
	en=st+L_out*L_in-1;
	DELTAM=reshape(DELTA(st:en),L_out,L_in);
