%% Neural network test

clear; close all; clc;

% load data
fprintf('Loading data ...\n');
	
load('ex4data1.mat');
load('ex4weights.mat');
[m,n]=size(X);
labels=min(y):max(y);
K=numel(labels);

sel=randperm(m)(1:100);

% vectorize y
y_vec=zeros(m,K);
for i=1:m
	y_vec(i,y(i,1))=1;
end

% network
hidden=[25];
network=[n;hidden(:);K];

% init theta
network
theta=neuralInitTheta(network);
size(neuralGetMatrix(theta,network,1))
size(neuralGetMatrix(theta,network,2))

% Cost with loaded Theta
fprintf('Cost with no regularization and loaded theta \n');
lambda=0;
Theta=[Theta1(:);Theta2(:)];
J=neuralCost(y_vec,X,Theta, network,lambda)
[p performance]=neuralPredict(y_vec,X,Theta,network);
performance

fprintf('Cost with lambda=1 and loaded theta \n');
lambda=1;
Theta=[Theta1(:);Theta2(:)];
J=neuralCost(y_vec,X,Theta, network,lambda)

[p performance]=neuralPredict(y_vec,X,Theta,network);
performance

% Verification of gradient calculation with numerical gradient
[J dJ]= neuralCost(y_vec(1:2,:),X(1:2,:),Theta,network,1);

costFunc=@(p)neuralCost(y_vec(1:2,:),X(1:2,:),p,network,1);
[cost, grad] = costFunc(Theta);

numgrad = numericalGradient(costFunc, Theta);
%disp([numgrad grad]);
diff = norm(dJ-grad)/norm(dJ+grad)

% optimization
options=optimset('MaxIter',400);
lambda=1;
costFunc=@(p)neuralCost(y_vec,X,p,network,1);
[optTheta optValue]=fmincg(costFunc,theta,options);
[p performance]=neuralPredict(y_vec,X,optTheta,network);


