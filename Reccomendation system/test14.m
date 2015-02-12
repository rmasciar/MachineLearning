%% Reccomendation system test
clear;close all;clc;

% load data
load('ex8_movies.mat');

[m u]=size(Y)
[Yn mu]=meanNormalize(Y);

J=CoFi