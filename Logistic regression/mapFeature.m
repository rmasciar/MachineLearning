function out=mapFeature(x1,x2,degree)

	out=ones(size(x1(:,1)));
	for i=1:degree
		for j=0:i
			out(:,end+1)=x1.^(i-j).*x2.^j;
		end
	end

