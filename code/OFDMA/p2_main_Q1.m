clc;   
close all;
clear all;

Rmin=5;
RminPower2=2^Rmin;
GAMA=(10^-10);
pMax=0.025;
Noise=(10^-10);
C=10;

pathGainAndPower=ones(10,3);
pathGainAndPower(1,1)=1;pathGainAndPower(1,2)=1.5*GAMA;
pathGainAndPower(2,1)=2;pathGainAndPower(2,2)=10*GAMA;
pathGainAndPower(3,1)=3;pathGainAndPower(3,2)=5*GAMA;
pathGainAndPower(4,1)=4;pathGainAndPower(4,2)=2*GAMA;
pathGainAndPower(5,1)=5;pathGainAndPower(5,2)=4*GAMA;
pathGainAndPower(6,1)=6;pathGainAndPower(6,2)=8*GAMA;
pathGainAndPower(7,1)=7;pathGainAndPower(7,2)=6.5*GAMA;
pathGainAndPower(8,1)=8;pathGainAndPower(8,2)=3.5*GAMA;
pathGainAndPower(9,1)=9;pathGainAndPower(9,2)=7*GAMA;
pathGainAndPower(10,1)=10;pathGainAndPower(10,2)=6*GAMA;

for q=1:10
    pathGainAndPower(q,2)=pathGainAndPower(q,2)/Noise;
end

pathGainAndPower=FuncRatePlus(pathGainAndPower,10,pMax,0.0000876);
for q=1:10
    if(pathGainAndPower(q,3)==-1)
        pathGainAndPower(q,3)=0;
    end
end
disp(pathGainAndPower);
disp(log2(1+(0.01*10))+log2(1+(0.01*8))+log2(1+(0.005*7)));
f=pathGainAndPower(:,3)';
h=pathGainAndPower(:,1)';
figure(1);
bar(h,f),grid on;
xlabel('channel');
ylabel('Power');
title('P2-Q1'); 
