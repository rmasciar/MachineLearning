function [etrain evalid]=validationCurve(xtrain,ytrain,xvalid,yvalid,lambda_vec)
	
	etrain=[];
	evalid=[];		

	for lambda=lambda_vec
		initTheta=initializeTheta(xtrain);
		costFunc=@(t)linearCost(ytrain,xtrain,t,lambda);
		options=optimset('MaxIter',200,'GradObj','on');
		theta=fmincg(costFunc,initTheta,options);
			
		etrain=[etrain;linearCost(ytrain,xtrain,theta,0)];
		evalid=[evalid;linearCost(yvalid,xvalid,theta,0)];
	end