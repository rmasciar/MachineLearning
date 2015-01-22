%% Neural network test

clear; close all; clc;

% load data
fprintf('Loading data ...\n');

load('ex4data1.mat');
[m,n]=size(X);
labels=min(y):max(y);

sel=randperm(m)(1:100);
display_array=[];
colormap(gray);
for i=sel
	display_arrayreshape(X(i,:),sqrt(n),sqrt(n))
end
imagesc(display_array)
