function [all_theta mu sd]=oneVsAll(y,x,labels,lambda,MaxIteration=50)
	
	[m,n]=size(x);
	
	% initialize theta
	initTheta=[];
	for i=labels
		initTheta=[initTheta initializeTheta(x)];
	end
	
	% normalize x
	if n<size(initTheta,1) % 1 column not present in x
		X=[ones(m,1) x];
	else X=x; n=n-1;
	end
	
	%[X mu sd]=normalize(X);
	
	% advanced optimization
	all_theta=[];
	options=optimset('GradObj','on','MaxIter',MaxIteration);
	for k=labels

		all_theta=[all_theta fmincg(@(t)(logCost((y==k),X,t,lambda)),...
			initTheta(:,k),options)];
	end
