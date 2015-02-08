%% K-means test
clear; close all; clc;

% load data
load('ex7data2.mat');

% define number of clusters
K=3;

% run k-means from different starting points
J=Inf;
cls=[];
centrs=[];
for i=1:100
	[clusters,centroids, J_history]=kmeans(X,K);
	if J_history(end)<J(end)
		J=J_history;
		cls=clusters;
		centrs=centroids;
	end
end

% plot cost
figure()
plot(1:length(J_history),J_history);

% plot progress
figure()
plot(X((clusters==1),1),X((clusters==1),2),'k+');
hold on
plot(X((clusters==2),1),X((clusters==2),2),'ko');
hold on
plot(X((clusters==3),1),X((clusters==3),2),'o');
hold on
plot(centrs(:,1),centrs(:,2),'.','MarkerSize',10);
hold off
