function [theta,h,J]=NeuralNetworks(y,x,hidden,lambda=1,MaxIteration=10^3)

m=size(y,1);
K=size(y,2);
n=size(x,2);
nodes=[n;hidden(:);K];
L=length(nodes);


%initialize theta
theta=[];
for j=2:L
	thetaTemp=rand(nodes(j),nodes(j-1)+1);
	theta=[theta;thetaTemp(:)];
end

%

h=zeros(m,K);

for i=1:m

	a0=[x(i,:)(:)];
	
	for j=2:L
		
		st=sum(nodes(2:(j-1)).*(nodes(1:(j-2))+1));
		en=st+nodes(j).*(nodes(j-1)+1);
		
		theta0=reshape(theta(st+1:en)(:),nodes(j),nodes(j-1)+1);
		a0=[1;a0];
		
		z1=theta0*a0;
		a1=1./(1+exp(-z1));
		a0=a1;
	
	end
	
	h(i,:)=a0';

end

J=0;
for i=1:m
	for k=1:K
		J=J+(-1/m)*(y(i,k)*log(h(i,k))+(1-y(i,k))*log(1-h(i,k)));
	end
end

for j=2:L
	st=sum(nodes(2:(j-1)).*(nodes(1:(j-2))+1));
	en=st+nodes(j).*(nodes(j-1)+1);
		
	theta0=reshape(theta(st+1:en)(:),nodes(j),nodes(j-1)+1);
	J=J+(lambda/(2*m))*sum(theta0(:,2:end)(:).^2);
end



