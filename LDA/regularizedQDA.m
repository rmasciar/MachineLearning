%%% character recognition with K-nearest neighbors
clear; close all; clc;

%%% load training data
train_id=1:6283;
save_training=0;
[x labels]=load_training(save_training);

all_labels=unique(labels);
K=numel(all_labels);

%%% divide training and validation data
[m n]=size(x);
id=randperm(m);
id_train=id(1:(ceil(m*0.6)));
id_valid=id((ceil(m*0.6)+1):end);

x_train=x(id_train,:);
x_valid=x(id_valid,:);
[m n]=size(x_train);
[m_valid n]=size(x_valid);

y_train=labels(id_train,:);
y_valid=labels(id_valid,:);

%%% calculate class probabilities, means and pooled sigma
pi=zeros(K,1);
mu=zeros(K,n);
sigma=zeros(n,n);
for i=1:K
  xi=x_train(y_train==all_labels(i),:);
  pi(i,1)=size(xi,1)/m;
  mu(i,:)=mean(xi,1);
  diff=xi-ones(size(xi,1),1)*mu(i,:);
  sigma=sigma+(1/(m-K)).*diff'*diff;
end

%%% calculate regularized sigma
alpha_vec=0:0.01:1;
performance_train=zeros(numel(alpha_vec),1);
performance_valid=zeros(numel(alpha_vec),1);
for t=1:numel(alpha_vec)
  alpha=alpha_vec(t);

for i=1:K
  xi=x_train(y_train==all_labels(i),:);
  
  diff=xi-ones(size(xi,1),1)*mu(i,:);
  sigmaK=(1/(size(xi,1)-1)).*diff'*diff;
  sigmaK=alpha*sigmaK+(1-alpha)*sigma;
  [uk dk vk]=svd(sigmaK);
  u(i,:)=uk(:)'; 
  d(i,:)=dk(:)';
end

discriminant_train=zeros(m,K);
discriminant_valid=zeros(m_valid,K);
for i=1:K
  uk=reshape(u(i,:),n,n);
  dk=reshape(d(i,:),n,n);
  dk_=zeros(size(dk));
  for j=1:size(dk_,1)
    dk_(j,j)=dk(j,j).^(-1);
  end
  diff_train=uk'*(x_train-ones(m,1)*mu(i,:))';
  discriminant_train(:,i)=-0.5*sum(log(diag(dk)))+log(pi(i))-0.5*diag(diff_train'*dk_*diff_train);
  
  diff_valid=uk'*(x_valid-ones(m_valid,1)*mu(i,:))';
  discriminant_valid(:,i)=-0.5*sum(log(diag(dk)))+log(pi(i))-0.5*diag(diff_valid'*dk_*diff_valid);
end

[val pos_train]=max(discriminant_train,[],2);
labels_train=all_labels(pos_train);
performance_train(t)=mean(labels_train==y_train)
[val pos_valid]=max(discriminant_valid,[],2);
labels_valid=all_labels(pos_valid);
performance_valid(t)=mean(labels_valid==y_valid)

end