function [model]=trainSVM(y,x,C,kernel)


% initial definitions
tol=1e-3;
maxpasses=5;

[m n]=size(x);
y(y==0)=-1;
alpha=zeros(m,1);
b=0;
E=zeros(m,1);


passes=0;

while passes<maxpasses

	num_changed_alphas=0;

	for i=1:m

		E(i)=b+sum(alpha.*y.*kernel(x(i,:),x))-y(i);

		if (y(i)*E(i)+tol<0 && alpha(i)<C) ||(y(i)*E(i)-tol>0 && alpha(i)>0)

			j=i;
			while j==i
				j=ceil(m*rand());
			end

			E(j)=b+sum(alpha.*y.*kernel(x(j,:),x))-y(j);
			a_iold=alpha(i);
			a_jold=alpha(j);
			
			if y(i)==y(j)
				L=max(0,a_iold+a_jold-C);
				H=min(C,a_iold+a_jold);
			else 
				L=max(0,a_jold-a_iold);
				H=min(C,C+a_jold-a_iold);
			end			
			
			if L==H
				continue;
			end
			
			k1=kernel(x(i,:),x(j,:));
			k2=kernel(x(i,:),x(i,:));
			k3=kernel(x(j,:),x(j,:));
			eta=2*k1-k2-k3;

			if eta>=0
				continue;
			end

			alpha(j)=a_jold-y(j)*(E(i)-E(j))/eta;
			alpha(j)=min(H,alpha(j));
			alpha(j)=max(L,alpha(j));
			
			if abs(alpha(j)-a_jold)<tol
				alpha(j)=a_jold;
				continue
			end
			
			alpha(i)=a_iold+y(i)*y(j)*(a_jold-alpha(j));

			b1=b-E(i)...
				-y(i)*(alpha(i)-a_iold)*kernel(x(i,:),x(i,:))...
				-y(j)*(alpha(j)-a_jold)*kernel(x(i,:),x(j,:));

			b2=b-E(j)...
				-y(i)*(alpha(i)-a_iold)*kernel(x(i,:),x(j,:))...
				-y(j)*(alpha(j)-a_jold)*kernel(x(j,:),x(j,:));
			
			if (0<alpha(i) && alpha(i)<C)
				b=b1;
			elseif (0<alpha(j) && alpha(j)<C)
				b=b2;
			else 
				b=(b1+b2)/2;
			end
	
			num_changed_alphas=num_changed_alphas+1;
			
		end
	
	end

	if num_changed_alphas==0
		passes=passes+1;
	else passes=0;

	end	
	
end

w=((alpha.*y)'*x)';

model.alpha=alpha;
model.w=w;
model.b=b;
model.x=x;
model.y=y;
model.kernel=kernel;
