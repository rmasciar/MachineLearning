function r=takeStep(i,j)
	if i==j
		return;
	end
	
	% SVM output on point i -y(i)
	E(i)=b+sum(alpha.*y.*kernel(x(i,:),x))-y(i);

	s=y(i)*y(j);
	
	% Compute L, H	
	if s==1
		L=max(0,a_iold+a_jold-C);
		H=min(C,a_iold+a_jold);
	else 
		L=max(0,a_jold-a_iold);
		H=min(C,C+a_jold-a_iold);
	end
	
	if L==H
		return;
	end
	
	k11=kernel(x(i,:),x(i,:));
	k12=kernel(x(i,:),x(j,:));
	k22=kernel(x(j,:),x(j,:));
	eta=2*k12-k11-k22;
	
	if eta<0
		alpha(j)=a_jold-y(j)*(E(i)-E(j))/eta;
		alpha(j)=max(L,alpha(j));
		alpha(j)=min(alpha(j),H);
	else
		
	
	end
	
	if alpha(j)<1e-8
		alpha(j)=0;
	elseif alpha(j)>C-1e-8
		alpha(j)=C;
	end
	
	if abs(alpha(j)-a_jold)<tol*(alpha(j)+a_jold+tol)
		return
	end

	a(i)=a_iold+s(alpha(j)-a_jold)
