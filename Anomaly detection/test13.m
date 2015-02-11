%% Anomaly detection test
clear; close all; clc;

% load data
load('ex8data1.mat');

% plot data
plot(X(:,1),X(:,2),'bx');
hold on

% anomalyDetection
[model epsilon F1score]=anomalyDetection(X,Xval,yval,multivariate=1);

epsilon
F1score

clear;close all;

% load data
load('ex8data2.mat');

% plot data
plot(X(:,1),X(:,2),'bx');
hold on

% anomalyDetection
[model epsilon F1score]=anomalyDetection(X,Xval,yval,multivariate=1);
p=anomalyDetectionPredict(X,model);
sum(p<epsilon)

epsilon
F1score