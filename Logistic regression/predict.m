function h=predict(type,X,theta)

	if strcmp(type,'linear')==1
		m=size(X,1);
	
		if size(theta,1)>size(X,2)
			X=[ones(m,1) X];
		end
	
		h=X*theta;
	elseif strcmp(type,'logistic')==1
		m=size(X,1);
	
		if size(theta,1)>size(X,2)
			X=[ones(m,1) X];
		end
	
		z=X*theta;
		h=1./(1+exp(-z));
		
	end
