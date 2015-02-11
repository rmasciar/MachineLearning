function F1=calculateF1score(y_predicted,y_actual)

	tp= sum(y_predicted==1 & y_actual==1);

	precision=tp/sum(y_predicted==1);
	recall=tp/sum(y_actual==1);

	F1=2*precision*recall/(precision+recall);