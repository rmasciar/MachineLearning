%% Anomaly detection test
clear; close all; clc;

% load data
load('ex8data1.mat');

% plot data
plot(X(:,1),X(:,2),'bx');
axis([0 30 0 30]);
xlabel('Latency (ms)');
ylabel('Throughput (mb/s)');
hold on

% calculate model on training data
p=calculateProbabilities(X,multivariate=1);

% load 