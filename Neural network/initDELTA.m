function DELTA0=initDELTA(network)

	L=length(network);
	DELTA0=[];

	for l=2:L
		L_in=network(l-1)+1;
		L_out=network(l);

		DELTA=zeros(L_out,L_in);
		DELTA0=[DELTA0;DELTA(:)];
	end