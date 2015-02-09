function displayData(x,row,col)

	[m n]=size(x);
	facemap=facemap=[];
	
	i=0;
	while i<row*col
		riga=[];
		for j=1:col
			i=i+1;
			riga=[riga reshape(x(i,:),sqrt(n),sqrt(n))];
		end
		facemap=[facemap;riga];
	end

	colormap(gray)
	imagesc(facemap)