%% Linear regression test - 

clear; close all; clc;

% load data
fprintf('Loading data ...\n');

load('ex5data1.mat');
[m,n]=size(X);

% plot training data
plot(X,y,'rx','MarkerSize',10,'LineWidth',1.5);
xlabel('Change in water level');
ylabel('Water flowing out of the dam');

% initial cost-gradient
theta=[1;1];
lambda=1;
[J dJ]=linearCost(y,X,theta,lambda)

% theta optimization
initTheta=initializeTheta(X);
costFunc=@(t)linearCost(y,X,t,0);
options=optimset('MaxIter',200,'GradObj','on');
theta=fmincg(costFunc,initTheta,options);

plot(X,y,'rx','MarkerSize',10,'LineWidth',1.5);
xlabel('Change in water level');
ylabel('Water flowing out of the dam');
hold on;
plot(X,[ones(m,1) X]*theta,'--','LineWidth',2);
hold off;