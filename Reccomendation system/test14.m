%% Reccomendation system test
clear;close all;clc;

% load data
load('ex8_movies.mat');
load('ex8_movieParams.mat');

% test on part of data
num_users = 4; num_movies = 5; num_features = 3;
X = X(1:num_movies, 1:num_features);
Theta = Theta(1:num_users, 1:num_features);
Y = Y(1:num_movies, 1:num_users);
R = R(1:num_movies, 1:num_users);

lambda=0;
J=CoFiCost(Y,R,[X(:);Theta(:)],lambda,num_movies,num_users,num_features);
lambda=1.5;
J=CoFiCost(Y,R,[X(:);Theta(:)],lambda,num_movies,num_users,num_features);

diff1=checkCostFunc(0);
diff2=checkCostFunc(1.5);

% learn parameters
clear; close all;
load('ex8_movies.mat');

% personal ratings
movielist=loadMovieList('movie_ids.txt');
my_ratings=zeros(size(movielist));
my_ratings(1) = 4;
my_ratings(98) = 2;
my_ratings(7) = 3;
my_ratings(12)= 5;
my_ratings(54) = 4;
my_ratings(64)= 5;
my_ratings(66)= 3;
my_ratings(69) = 5;
my_ratings(183) = 4;
my_ratings(226) = 5;
my_ratings(355)= 5;

Y=[my_ratings Y];
R=[(my_ratings~=0) R];

% mean normalization
[Yn mu]=meanNormalize(Y,R);

% optimization of X and Theta
[m u]=size(Y);
n=10;

initParam=randn((m*n+u*n),1);
options = optimset('GradObj', 'on', 'MaxIter', 400);

lambda=10;
costFunc=@(parameters)CoFiCost(Yn,R,parameters,lambda,m,u,n);
[optTheta optValue]=fmincg(costFunc,initParam,options);

% prediction
pred=CoFiPredict(optTheta,mu,m,u,n);
[r, ix]=sort(pred(:,1),'descend');
movielist(ix(1:5),:)