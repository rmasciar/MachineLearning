%%% character recognition with K-nearest neighbors
clear; close all; clc;

%%% load training data
train_id=1:6283;
save_training=0;
[x labels]=load_training(save_training);

[m n]=size(x);

%%% correlation matrix to calculate distance between examples
c=abs(corr(x')-eye(m,m));
[distance position]=sort(c,2,'descend');

posLabel=labels(position);

all_labels=unique(labels);

K=10
accuracy=zeros(K,1);
for k=1:K
	%%% Leave One Out Cross Validation
	count=zeros(m,numel(all_labels));

	lab=posLabel(:,1:k);

	for l=1:numel(all_labels)
		count(:,l)=sum(lab==all_labels(l),2);
	end
		
	[v p]=max(count,[],2);
	pred=all_labels(p);
	pred(v==1)=lab(v==1,1);

	accuracy(k,1)=mean(pred==labels);

end

plot(1:K,accuracy)
[v k_chosen]=max(accuracy);

fprintf(' paused \n');
pause

%%% load test data
test_id=6284:12503;
save_test=0;
[test]=load_test(save_test);

xtest=[x;test];
clear x;
clear test;
[m n]=size(xtest);
c=abs(corr(xtest')-eye(m,m))(test_id,train_id);
[distance position]=sort(c,2,'descend');

posLabel=labels(position);

count=zeros(numel(test_id),numel(all_labels));
lab=posLabel(:,1:k_chosen);
for l=1:numel(all_labels)
	count(:,l)=sum(lab==all_labels(l),2);
end
	
[v p]=max(count,[],2);
predtest=all_labels(p);
predtest(v==1)=lab(v==1,1);

csvwrite('pred.csv',predtest);
