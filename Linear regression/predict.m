function h=predict(type,X,theta)

	if type=='linear'
		m=size(X,1);
	
		if size(theta,1)>size(X,2)
			X=[ones(m,1) X];
		end
	
		h=X*theta;
	end