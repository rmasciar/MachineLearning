%% pca test 2
clear; close all; clc;

% load data
load('ex7faces.mat');
[m n]=size(X);

% display data
figure(1)
displayData(X,10,10);

% pca
[ured z xapprox]=pca(X,0.95);
size(ured)
figure(2)
displayData(ured',13,10)

% display reconstructed image
figure(3)
displayData(xapprox,10,10);

% 
[clusters centroids J_history]=kmeans(z,2);
figure(4)
displayData(X(clusters==1,:),10,10);
figure(5)
displayData(X(clusters==2,:),10,10);
%figure(6)
%displayData(X(clusters==3,:),10,10);