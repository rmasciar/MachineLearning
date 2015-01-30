function mapped=polynomialMap(vect,degree)

	mapped=[];
	for p=1:degree
		mapped=[mapped vect.^p];
	end