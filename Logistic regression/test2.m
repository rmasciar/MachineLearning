%% Logistic regression test

clear; close all; clc;

% load data
fprintf('Loading data...\n');
data=load('ex2data1.txt');
X=data(:,1:2); y=data(:,3);
[X, mu, sd]=normalize(X);

[m,n]=size(X);

% initialize theta
initTheta=initializeTheta(X);

% initial cost
J0=logCost(y,X,initTheta,0)

% gradient descent
alpha=0.5;
lambda=0.00;
MaxIter=700;

[theta,J_history]=gradientDescent(y,X,@logCost,lambda,alpha,MaxIter);
plot(J_history);

% predict
h=predict('logistic',X,theta);

theta
J_final=J_history(end,1)

% advanced optimization
options=optimset('GradObj','on','MaxIter',500);

[thetaAdv, JAdv]=fminunc(@(t)(logCost(y,X,t,0)),initTheta,options)

% predict
x1=[1 45 85];
mu
sd
h1=predict('logistic',x1,theta,mu,sd)
h2=predict('logistic',x1,thetaAdv,mu,sd)