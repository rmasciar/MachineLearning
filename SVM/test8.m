%% Support vector machine test

clear;close all;clc;

% load data
fprintf('Load and visualize data ...\n');
load('ex6data2.mat');

% Kernel test

sigma=0.1;
[linearKernel polynomialKernel gaussianKernel]=defineKernels(1, 10, sigma);

% train SVM
	
C=1;
model=trainSVM(y,X,C,polynomialKernel);
pred=SVMpredict(X,model);

y(y==0)=-1;
mean(pred==y)
