function anomalies=anomalyDetection(x,epsilon)
	
	[m n]=size(x);
	probs=calculateProbabilities(x);
	
	anomalies=probs<epsilon;
