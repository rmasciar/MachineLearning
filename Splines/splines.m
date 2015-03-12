clear; clc; close all;

M=5;

x=0:0.001:1;
epsilon=linspace(0,1,4);
epsilon=epsilon(2:(numel(epsilon)-1));

function Bsplines(x,knots,M)

[b1,b1_cut]=Haar_basis(x,epsilon,M,1);
[b2 b2_cut]=Haar_basis(x,epsilon,M,2,b1);
[b3 b3_cut]=Haar_basis(x,epsilon,M,3,b2);
[b4 b4_cut]=Haar_basis(x,epsilon,M,4,b3);

plot(x,b4_cut(1,:),'r')
hold on
plot(x,b4_cut(2,:),'g')
plot(x,b4_cut(3,:),'b')
plot(x,b4_cut(4,:),'y')
plot(x,b4_cut(5,:),'bk')

plot(x,b4_cut(6,:),'r')
plot(x,b4_cut(7,:),'g')
plot(x,b4_cut(8,:),'b')
plot(x,b4_cut(9,:),'y')
plot(x,b4_cut(10,:),'bk')

plot(x,b4_cut(11,:),'r')
plot(x,b4_cut(12,:),'g')
