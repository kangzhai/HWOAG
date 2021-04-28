function MainHWOAG
%Hybrid Whale Optimization Algorithm with Gathering strategies , HWOAG         %
%_________________________________________________________________________%
%Hybrid WOA with Gathering strategies (HWOAG) source codes demo 1.0          %
%                                                                         %
%  Developed in MATLAB R2014b                                             %
%                                                                         %
%  Author and programmer: Xinming Zhang                                   %
%                                                                         %
%         e-Mail: xinmingzhang@126.com                                    %
%   Main paper: Xinming Zhang, Shaochen Wen.                              %
%Hybrid whale optimization algorithm with gathering strategies for high-dimensional%
%problems,Expert Systems with Applications, 2021,                            %
%https://doi.org/10.1016/j.eswa.2021.115032£¬                                %            
%_________________________________________________________________________%
clc;
clear;
Num=30;
D=4000;
if D<=4000   
    MaxDT=1250;N=40;
else
    MaxDT=1500;N=40;
end
Vt=zeros(1,Num);
f ='Rosenbrock';a=-10*ones(1,D);b=10*ones(1,D);

CBest=zeros(1,MaxDT);
time=0;
for i=1:Num
    tic;
    [u0,s,~] =HWOAG(f,a,b,D,MaxDT,N);
    time=((i-1)*time+toc)/i;
    CBest(1,:)=CBest(1,:)+s;
    Vt(i)=u0;
end
MeanValue=mean(Vt);
StdValue=std(Vt);
GoodValue=min(Vt);
BadValue=max(Vt);
plot(Vt)
title([' HWOAG£ºMean=',num2str(MeanValue),'£¬Std=',num2str(StdValue)]);
xlabel(['Vma=',num2str(BadValue),'£¬Vmi=',num2str(GoodValue),'£¬Time=',num2str(time)]);

function [out]=Rosenbrock(in)
x0=in(:,1:end-1);
x1=in(:,2:end);
out = sum( (100*(x1-x0.^2).^2 + (x0-1).^2) , 2);