%% Logistic regression test

clear; close all; clc;

% load data
fprintf('Loading data...\n');
data=load('ex2data2.txt');
X=data(:,1:2); y=data(:,3);

X=mapFeature(X(:,1),X(:,2));

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

% advanced optimization
options=optimset('GradObj','on','MaxIter',500);

[thetaAdv, JAdv]=fminunc(@(t)(logCost(y,X,t,0)),initTheta,options);

% predict new sample
x1=[45 85];
x1=mapFeature(x1(:,1),x1(:,2));

h1=predict('logistic',x1,theta,mu,sd)
h2=predict('logistic',x1,thetaAdv,mu,sd)

% accuracy

h=predict('logistic',X,theta)>=0.5;
hAdv=predict('logistic',X,thetaAdv)>=0.5;
accuracy=mean(h==y)*100
accuracyAdv=mean(hAdv==y)*100
