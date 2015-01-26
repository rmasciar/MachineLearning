%% Neural network test, y=labels

clear; close all; clc;

% load data
fprintf('Loading data ...\n');

load('ex4data1.mat');
[m,n]=size(X);
labels=min(y):max(y);

% display examples
fprintf('Displaying example data ...\n');
displayMatrix(X,10,10);

% load parameters
fprintf('Loading parameters and network ...\n');
load('ex4weights.mat');

network=[n;size(Theta1,1);size(Theta2,1)];
theta=[Theta1(:);Theta2(:)];

% predict 
fprintf('Predicting handwritten digit ...\n');
h=neuralPredict(y,X,theta,network);
[val p]=max(h,[],2);

% performance
neuralCostF(y,X,theta,network,1)
fprintf('Calculating performance ...\n');
mean(p==y)*100

% initialize parameters
theta=neuralInitTheta(network);

% check gradients
lambda=1

[cost, grad]=neuralCostF(y(1,:),X(1,:),theta,network,lambda);
numgrad=numericalGradient(y(1,:),X(1,:),theta,network,lambda);

%costFunc = @(p) neuralCostF(y(1,:),X(1,:),p,network,lambda);

%[cost, grad] = costFunc(theta);
%numgrad = numericalGradient(costFunc, theta);
 
diff = norm(numgrad-grad)/norm(numgrad+grad)

% optimization

options = optimset('MaxIter', 50);
costFunc = @(p) neuralCostF(y,X,p,network,lambda);
[nn_params, cost] = fmincg(costFunc, theta, options);
h=neuralPredict(y,X,nn_params,network);
[val p]=max(h,[],2);
mean(p==y)*100
