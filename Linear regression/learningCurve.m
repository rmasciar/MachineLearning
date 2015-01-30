function [etrain evalid]=learningCurve(xtrain,ytrain,xvalid,yvalid,lambda)

	[m n]=size(xtrain);
	
	etrain=[];
	evalid=[];

	for i=1:m
		initTheta=initializeTheta(xtrain(1:i,:));
		costFunc=@(t)linearCost(ytrain(1:i,:),xtrain(1:i,:),t,lambda);
		options=optimset('MaxIter',200,'GradObj','on');
		theta=fmincg(costFunc,initTheta,options);
		
		etrain=[etrain;linearCost(ytrain(1:i,:),xtrain(1:i,:),theta,0)];
		evalid=[evalid;linearCost(yvalid,xvalid,theta,0)];
		
	end
