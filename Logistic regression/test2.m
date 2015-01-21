%% Logistic regression test

clear; close all; clc;

% load data
fprintf('Loading data...\n');
data=load('ex2data1.txt');
X=data(:,1:2); y=data(:,3);
X=normalize(X);

[m,n]=size(X);

% initialize theta
initTheta=zeros(n+1,1);

% initial cost
J0=logCost(y,X,initTheta,0.01)

