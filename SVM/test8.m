<<<<<<< HEAD
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
=======
%% Support vector machine test

clear;close all;clc;

% load data
fprintf('Load data ...\n');
load('ex6data2.mat');

% Kernel definition
fprintf('Kernel definition ...\n');
sigma=0.1;
kernel=@(xi,l)gaussianKernel(xi,l,sigma);

% train SVM
C=1;
fprintf('Training SVM ...\n');
tic()
model=trainSVM(y,X,C,kernel);
toc()

% predict y
fprintf('Predicting training set\n');
tic()
pred=SVMpredict(X,model);
toc()

% performance on training set
fprintf('SVM performance set\n');
y(y==0)=-1;
mean(pred==y)
>>>>>>> a0988e0ed6a6a5735d62c71c925bbc9b4b2d6b93
