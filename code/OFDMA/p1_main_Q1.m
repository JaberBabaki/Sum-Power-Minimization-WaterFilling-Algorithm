clc;   
close all;
clear all;

Rmin=5;
RminPower2=2^Rmin;
e1=(10^-10);
Noise=(10^-10);
C=10;

pathGainAndPower=ones(10,3);
pathGainAndPower(1,1)=1;pathGainAndPower(1,2)=1.5*e1;
pathGainAndPower(2,1)=2;pathGainAndPower(2,2)=10*e1;
pathGainAndPower(3,1)=3;pathGainAndPower(3,2)=5*e1;
pathGainAndPower(4,1)=4;pathGainAndPower(4,2)=2*e1;
pathGainAndPower(5,1)=5;pathGainAndPower(5,2)=4*e1;
pathGainAndPower(6,1)=6;pathGainAndPower(6,2)=8*e1;
pathGainAndPower(7,1)=7;pathGainAndPower(7,2)=6.5*e1;
pathGainAndPower(8,1)=8;pathGainAndPower(8,2)=3.5*e1;
pathGainAndPower(9,1)=9;pathGainAndPower(9,2)=7*e1;
pathGainAndPower(10,1)=10;pathGainAndPower(10,2)=6*e1;
for q=1:10
    pathGainAndPower(q,2)=pathGainAndPower(q,2)/Noise;
end
pathGainAndPower = sortrows(pathGainAndPower, 2,'descend');

pathGainAndPower=FuncPowerPlus(pathGainAndPower,RminPower2,10,0.0000876);

f=pathGainAndPower(:,3)';
h=pathGainAndPower(:,1)';
figure(1);
bar(h,f),grid on;
xlabel('chanel');
ylabel('Power');
title('Q1'); 

disp(pathGainAndPower);

