%% Linear regression test

clear; close all; clc;
	
% load data
fprintf('Loading data...\n');
data=load('ex1data2.txt');
X=data(:,1:2); y=data(:,3);

fprintf('Normalizing X...\n');
[X, mu, sd]=normalize(X);


fprintf('Initialization...\n');
% initialize theta
initTheta=initializeTheta(X);

% initial cost
J0=linearCost(y,X,initTheta,0)

fprintf('Gradient descent...\n');
% gradient descent
alpha=0.1;
lambda=0.01;

[theta,J_history]=gradientDescent(y,X,@linearCost,lambda,alpha,MaxIter=10^5);
plot(J_history);

% Performance calculation
fprintf('Calculating performance...\n');
h=predict('linear',X,theta);
rmse=sqrt((1/size(y,1)).*(h-y)'*(h-y))


