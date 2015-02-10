%% pca test
clear; close all; clc;

% load data
load('ex7data1.mat');
[m n]=size(X);

% normalize
Xorig=X;
[X mu sd]=normalize(X);

% covariance/correlation matrix
r=(1/(m-1))*X'*X;

% singular value decomposition
[u s v]=svd(r);

% variance threshold
threshold=0.80;
Kmax=n-1;
K=n;
for i=1:n
	if sum(diag(s)(1:i))/sum(diag(s))>=threshold
		K=i;
		break;
	end
end
K=min(Kmax,K);

% dimension reduction
ured=u(:,1:K);
z=X*ured;

% xapprox
xapprox=z*ured';
xapprox=(xapprox.*(ones(m,1)*sd))+ones(m,1)*mu;

% plot x, xapprox
plot(Xorig(:,1),Xorig(:,2),'b+');
hold on
plot(xapprox(:,1),xapprox(:,2),'ro');
hold on
for i = 1:m
    drawLine(Xorig(i,:), xapprox(i,:), '--k', 'LineWidth', 1);
end
hold off

