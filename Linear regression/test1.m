%% Linear regression test

clear; close all; clc;
	
% load data
fprintf('Loading data...\n');
data=load('ex1data2.txt');
X=data(:,1:2); y=data(:,3);
X=normalize(X);

[m,n]=size(X);

% initialize theta
initTheta=zeros(n+1,1);

% initial cost
J0=linearCost(y,X,initTheta,0.01)

% gradient descent
alpha=0.01;
lambda=0.01;

[theta,J_history]=gradientDescent(y,X,@linearCost,lambda=0.1,alpha=0.01,MaxIter=10^5);
plot(J_history);

% predict
h=predict('linear',X,theta);

theta
