%% Reccomendation system test
clear;close all;clc;

% load data
load('ex8_movies.mat');

[m u]=size(Y);
n=5;
[Yn mu]=meanNormalize(Y,R);

initParam=0.001*rand(m*n+u*n);

lambda=0;

costFunc=@(parameters)CoFicost(Yn,R,parameters,lambda,m,u,n);
[optTheta optValue]=fmincg(costFunc,initParam);
