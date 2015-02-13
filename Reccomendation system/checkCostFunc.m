function diff=checkCostFunc(lambda)	

	
	%% Create small problem
	X_t = rand(4, 3);
	Theta_t = rand(5, 3);
	
	% Zap out most entries
	Y = X_t * Theta_t';
	Y(rand(size(Y)) > 0.5) = 0;
	R = zeros(size(Y));
	R(Y ~= 0) = 1;
	
	%% Run Gradient Checking
	X = randn(size(X_t));
	Theta = randn(size(Theta_t));
	parameters=[X(:);Theta(:)];
	nuser = size(Y, 2);
	nmovies = size(Y, 1);
	n = size(Theta_t, 2);

	[J dJ]=CoFiCost(Y,R,parameters,lambda,nmovies,nuser,n);
	costFunc=@(parameters)CoFiCost(Y,R,parameters,lambda,nmovies,nuser,n);
	numgrad=numericalGradient(costFunc,parameters);

	diff=norm(dJ-numgrad)/norm(dJ+numgrad);