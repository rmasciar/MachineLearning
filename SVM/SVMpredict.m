function pred=SVMpredict(x,model)
	
	[m n]=size(x);
	pred=[];

	for i=1:m
		pred=[pred;model.b+sum(model.alpha.*model.y.*model.kernel(model.x(i,:),model.x))];
	end
	
	pred=sign(pred);
