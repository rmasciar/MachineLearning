function [f epsilon_chosen F1max]=anomalyDetection(x_train,x_valid,y_valid,multivariate=0)


	[mu sigma f]=anomalyDetectionTraining(x_train,multivariate);

	[m n]=size(x_valid);

	F1max=0;
	epsilon_chosen=1;

	p=anomalyDetectionPredict(x_valid,f);
	step_=(max(p)-min(p))/1e5;
	for iepsilon=min(p):step_:max(p)
		y=zeros(m,1);
		y(p<iepsilon)=1;
		F1score=calculateF1score(y,y_valid);
		if F1max<F1score
			F1max=F1score;
			epsilon_chosen=iepsilon;
		end
	end