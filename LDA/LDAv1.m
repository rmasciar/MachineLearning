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

%%% svd decomposition of sigma
[u d v]=svd(sigma);

%%% calculate X*
d_=zeros(size(d));
for i=1:size(d,1)
  d_(i,i)=d(i,i).^(-0.5);  
end
x_train_star=(d_*(u')*x_train')';
x_valid_star=(d_*(u')*x_valid')';
mu_star=(d_*(u')*mu')';

%%% calculate nearest centroid
pred_train=zeros(size(x_train_star,1),K);
pred_valid=zeros(size(x_valid_star,1),K);
for i=1:K
  pred_train(:,i)=0.5*sum((x_train_star-ones(size(x_train_star,1),1)*mu_star(i,:)).^2,2)-log(pi(i));
  pred_valid(:,i)=0.5*sum((x_valid_star-ones(size(x_valid_star,1),1)*mu_star(i,:)).^2,2)-log(pi(i));
end

[v pos_train]=min(pred_train,[],2);
[v pos_valid]=min(pred_valid,[],2);

labels_train=all_labels(pos_train);
mean(labels_train==y_train)
labels_valid=all_labels(pos_valid);
mean(labels_valid==y_valid)