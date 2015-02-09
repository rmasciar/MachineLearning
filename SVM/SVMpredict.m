<<<<<<< HEAD
function pred=SVMpredict(x,model)
	
	[m n]=size(x);
	pred=[];

	for i=1:m
		pred=[pred;model.b+sum(model.alpha.*model.y.*model.kernel(model.x(i,:),model.x))];
	end
	
	pred=sign(pred);
=======
function pred=SVMpredict(x,model)
	
	[m n]=size(x);
	pred=[];

	for i=1:m
		pred=[pred;model.b+sum(model.alpha.*model.y.*model.kernel(model.x(i,:),model.x))];
	end
	
	pred=sign(pred);
>>>>>>> a0988e0ed6a6a5735d62c71c925bbc9b4b2d6b93
