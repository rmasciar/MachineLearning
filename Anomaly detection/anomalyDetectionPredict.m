function p=anomalyDetectionPredict(x_valid,f)
	
	[m n]=size(x_valid);

	for i=1:m
		p(i,1)=f(x_valid(i,:));
	end