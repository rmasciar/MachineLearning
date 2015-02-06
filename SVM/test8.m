%% Support vector machine test

clear;close all;clc;

% load data
fprintf('Load and visualize data ...\n');
load('ex6data2.mat');

% Kernel test
sigma=0.1;
kernel=@(xi,l)gaussianKernel(xi,l,sigma)

% train SVM
	
C=1;
fprintf('Training \n');
model=trainSVM(y,X,C,kernel);

fprintf('Predicting \n');
pred=SVMpredict(X,model);

y(y==0)=-1;
mean(pred==y)
