function theta=NeuralNetworks(y,x,hidden)

m=size(y,1);
k=size(y,2);
n=size(x,2);
nodes=[n;hidden(:);k];
L=length(nodes);

%initialize theta

theta=[];
for l=2:L
	TempTheta=rand(nodes(l),nodes(l-1)+1);
	theta=[theta(:); TempTheta(:)];
end

for i=1:m
	
	
	for l=1:L
		TempTheta=reshape(theta(:),s(
	end

	a1=[1,x(i,:)];
	TempTheta=rand(nodes(1),n+1);
	z2=TempTheta*a1;
	a2=1./(1+exp(-z2));
	
end