%% Support vector machine test

clear;close all;clc;

% load data
fprintf('Load and visualize data ...\n');
load('ex6data2.mat');

% Kernel test

sigma=0.1;
[linearKernel polynomialKernel gaussianKernel]=defineKernels(0, 1, sigma);

% train SVM
	
C=1;
model=trainSVM(y,X,C,gaussianKernel);
pred=SVMpredict(X,model);
mean(pred=~y)