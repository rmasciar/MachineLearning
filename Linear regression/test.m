%% Linear regression test

clear; close all;
	
% plot data
fprintf('Plotting data...\n');
data=load('ex1data2.txt');
X=data(:,1);y=data(:,2);
X=normalize(X);
m=length(y);

figure;
plot(X,y,'rx','MarkerSize',10);
ylabel('Profit in $10,000');
xlabel('Population of City in 10,000');

% initialize theta
n=size(X,2);
initTheta=zeros(n+1,1);

% initial cost
J0=linearCost(y,X,initTheta,0.01)

% gradient descent
alpha=0.01;
lambda=0.01;

[theta,J_history]=gradientDescent(y,X,@linearCost,lambda=0.01,alpha=0.01,MaxIter=10^4);
plot(J_history);

% predict
h=predict('linear',X,theta);

theta