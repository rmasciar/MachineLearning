function [theta,h,J]=NeuralNetworks(y,x,hidden,lambda=1,MaxIteration=10^3)

m=size(y,1);
K=size(y,2);
n=size(x,2);
nodes=[n;hidden(:);K];

theta=initTheta(nodes,10^-1);


h=zeros(m,K);

for i=1:m
	
	[a,h0]=ForwardPropagation(x,i,theta,nodes,lambda)
	h(i,:)=h0;

end

[J]=NeuralCost(y,h,theta,nodes);



