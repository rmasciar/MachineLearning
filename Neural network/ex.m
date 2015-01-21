load('ex4data1.mat')

m=size(y,1);
Y=zeros(m,10);
for i=1:m
	Y(i,y(i,1))=1;
end

hidden=25;

[optTheta,network]=neuralNetwork(Y,X,hidden,lambda=0.1,MaxIter=400);
h=predict(X,optTheta,network)
