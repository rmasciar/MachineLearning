%% Logistic regression multi-class test

clear; close all; clc;
	
% load data
fprintf('Loading data...\n');

load('ex3data1.mat');
[m,n]=size(X);
labels=min(y):max(y);

% visualize some data
fprintf('Visualizing data...\n');

rand_indices=randperm(m);
sel=X(rand_indices(1:100),:);
displayData(sel);

% one vs all logistic regression
fprintf('Performing logistic regression...\n');

lambda=0.1;
[all_theta]=oneVsAll(y,X,labels,lambda,50);

% predict
fprintf('Finding maximum...\n');

h=predict('logistic',X,all_theta);
[val p]=max(h,[],2);

% performance	
fprintf('Calculating performance...\n');
precision=mean(p==y)*100;




