function matrix=neuralGetMatrix(vector,network,l)

	L_in=network(l)+1;
	L_out=network(l+1);

	if l==1
		st=1;
	else st=1;
		for l0=2:l
			st=st+(network(l0-1)+1)*network(l0);
		end
	end
	en=st+L_out*L_in-1;
	matrix=reshape(vector(st:en),L_out,L_in);
