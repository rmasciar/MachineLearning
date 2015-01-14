function theta=initTheta(nodes,epsilon=0.1)

L=length(nodes);
theta=[];
for j=2:L
	thetaTemp=epsilon*rand(nodes(j),nodes(j-1)+1);
	theta=[theta;thetaTemp(:)];
end
