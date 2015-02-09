function [ured z xapprox]=pca(x,threshold=0.99)

[m n]=size(x);

% normalize
[xn mu sd]=normalize(x);

% covariance/correlation matrix
r=(1/m)*xn'*xn;

% singular value decomposition
[u s v]=svd(r);

% variance threshold
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
z=xn*ured;

% xapprox
xapprox=z*ured';
xapprox=(xapprox.*(ones(m,1)*sd))+ones(m,1)*mu;