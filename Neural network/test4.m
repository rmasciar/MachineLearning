%% Neural network test

clear; close all; clc;

% load data
fprintf('Loading data ...\n');

load('ex3data1.mat');
[m,n]=size(X);
labels=min(y):max(y);

% select 100 points to display
sel=randperm(m);
sel=sel(1:100);

%displayData(X(sel,:));

% load weights
load('ex3weights.mat');

% construct network 
theta=[Theta1(:); Theta2(:)];
network=[n;size(Theta1,1);size(Theta2,1)];

% predict
h=predict(X,theta,network);
[val p]=max(h,[],2);

% evaluate performance
mean(p==y)*100