function pred=SVMpredict(x,model)
	
	[m n]=size(x);
	pred=[];

	for i=1:m
		pred=[pred;sum(model.alpha.*model.y.*kernel(x(i,:)(:),model.x')+b)];
	end
	
	pred(pred>=0)=1;
	pred(pred<0)=1;