function [model]=trainSVM(y,x,C,kernel)

	y(y==0)=-1;

	% initial definitions
	tol=1e-3;
	maxpasses=5;

	[m n]=size(x);

	alpha=zeros(m,1);
	E=zeros(m,1);	
	b=0;
	numChanged=0;
	examineAll=1;
	
	while numChanged>0 || examineAll
		numChanged=0;

		if examineAll
			% loop I over all training examples
			numChanged=numChanged+examineExample(I);			
		else 
			% loop I over examples where alpha is not 0 & not C
			numChanged=numChanged+examineExample(I);
		end

		
		if examineAll==1
			examineAll=0;
		elseif numChanged==0
			examineAll=1;
		end		
	end
