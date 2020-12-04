function [ distnceVector ] = FuncPosition()
    clear all;
    BsCOVRAGE=500;%base station coverage area
    Bs1POSITION=[250,250];
    userJoinBs1=ones(1,1);
    x=rand(1)*BsCOVRAGE;
    y=rand(1)*BsCOVRAGE;
    userJoinBs1(1,1)=complex(x,y);   
    distnceVector=FuncDistance(userJoinBs1,Bs1POSITION);
    %disp(x);
    %disp(y);
end

