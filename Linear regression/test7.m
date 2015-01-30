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
pause

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
pause

% learning curve
lambda=0;
[etrain evalid]=learningCurve(X,y,Xval,yval,lambda);
plot(1:m,etrain,1:m,evalid)
title('Learning curve for linear regression')
legend('Train', 'Cross Validation')
xlabel('Number of training examples')
ylabel('Error')
axis([0 13 0 150])
pause

% polynomial mapping
degree=8;
X_poly=polynomialMap(X,degree);
[X_poly mu sd]=normalize(X_poly);

X_poly_val=polynomialMap(Xval,degree);
X_poly_val=normalize(X_poly_val,mu,sd);

X_poly_test=polynomialMap(Xtest,degree);
X_poly_test=normalize(X_poly_test,mu,sd);

% theta optimization for polynomial mapping
lambda=0;
initTheta=initializeTheta(X_poly);
costFunc=@(t)linearCost(y,X_poly,t,lambda);
options=optimset('MaxIter',200,'GradObj','on');
theta=fmincg(costFunc,initTheta,options);

plot(X, y, 'rx', 'MarkerSize', 10, 'LineWidth', 1.5);
hold on
plotFit(min(X),max(X),mu,sd,theta,degree);
hold off;
xlabel('Change in water level (x)');
ylabel('Water flowing out of the dam (y)');
title (sprintf('Polynomial Regression Fit (lambda = %f)', lambda));
pause

% validation curve
lambda_vec = [0 0.001 0.003 0.01 0.03 0.1 0.3 1 3 10];
[etrain evalid]=validationCurve(X_poly,y,X_poly_val,yval,lambda_vec);
plot(lambda_vec, etrain, lambda_vec, evalid);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');

% choose lambda
[e p]=min(evalid);
lambda_chosen=lambda_vec(p)
initTheta=initializeTheta(X_poly);
costFunc=@(t)linearCost(y,X_poly,t,lambda_chosen);
options=optimset('MaxIter',200,'GradObj','on');
theta=fmincg(costFunc,initTheta,options);
linearCost(ytest,X_poly_test,theta,0)