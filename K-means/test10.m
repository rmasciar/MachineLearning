%% K-means image compression test
clear; close all; clc;

% load data
A=imread('bird_small.png'); % load('bird_small.mat');
[m n t]=size(A);

% define number of clusters
K=16;

% reshape matix
X=double(reshape(A,m*n,t));

% run k-means from different starting points
J=Inf;
cls=[];
centrs=[];
for i=1:10
tic()
	[clusters,centroids, J_history]=kmeans(X,K);
	if J_history(end)<J(end)
		J=J_history;
		cls=clusters;
		centrs=centroids;
	end
toc()
fprintf('%.0f iterations \n',i);
end

% reshape image
tic()
X_compressed=normalize(centrs(cls,:));
toc()
X_compressed=reshape(X_compressed,m,n,t);

% plot images
subplot(1,2,1)
imagesc(A)
subplot(1,2,2)
imagesc(X_compressed)
