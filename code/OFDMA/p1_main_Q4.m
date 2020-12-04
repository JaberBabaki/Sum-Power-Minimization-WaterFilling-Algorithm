clc;   
close all;
clear all;

Alfa=3;
Rmin=50;
RminPower2=2^Rmin;
Noise=(10^-9);
C=[50, 100, 150, 200, 250];
power50=zeros(1,50);
power100=zeros(1,100);
power150=zeros(1,150);
power200=zeros(1,200);
power250=zeros(1,250);
h50=zeros(1,50);
h100=zeros(1,100);
h150=zeros(1,150);
h200=zeros(1,200);
h250=zeros(1,250);

format long;
for j=1:15
    distnceVector=FuncPosition();
    for o=1:5
        x = exprnd(1, [1,C(o)]);
        pathGainVector=FuncPathGain(distnceVector,x,Alfa);
        pathGain=ones(C(o),3);
        for i=1:C(o)
            pathGain(i,1)=i;
            pathGain(i,2)=pathGainVector(i)/Noise; 
        end
        pathGain = sortrows(pathGain, 2,'descend');
        pathGain=FuncPowerPlus(pathGain,RminPower2,C(o),0.0000876);
        %disp(pathGain);
        for  k=1:C(o)
            if(C(o)==50)
                power50(1,k)=power50(1,k)+pathGain(k,3);
                h50=pathGain(:,1);
            elseif(C(o)==100)
                power100(1,k)=power100(1,k)+pathGain(k,3); 
                h100=pathGain(:,1);
            elseif(C(o)==150) 
                power150(1,k)=power150(1,k)+pathGain(k,3);
                h150=pathGain(:,1);
            elseif(C(o)==200)
                power200(1,k)=power200(1,k)+pathGain(k,3);
                h200=pathGain(:,1);
            elseif(C(o)==250)  
                power250(1,k)=power250(1,k)+pathGain(k,3);
                h250=pathGain(:,1);
            end
        end
    end
end
power50=power50./15;
b=0;
y=0;
for o=1:50
 if( power50(1,o)>0)
     y=y+1;
 end
 b=power50(1,o)+b ;  
end
disp(b);
disp(y);
figure;
bar(h50,power50),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4-50-channel');

power100=power100./15;
b=0;
y=0;
for o=1:100
 if( power100(1,o)>0)
     y=y+1;
 end
 b=power100(1,o)+b ;  
end
disp(b);
disp(y);
figure;
bar(h100,power100),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4-100-channel');

power150=power150./15;
b=0;
y=0;
for o=1:150
 if( power150(1,o)>0)
     y=y+1;
 end
 b=power150(1,o)+b ;  
end
disp(b);
disp(y);
figure;
bar(h150,power150),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4-150-channel');
 
power200=power200./15;
b=0;
y=0;
for o=1:200
 if( power200(1,o)>0)
     y=y+1;
 end
 b=power200(1,o)+b ;  
end
disp(b);
disp(y);
figure;
bar(h200,power200),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4-200-channel');

power250=power250./15;
b=0;
y=0;
for o=1:250
 if( power250(1,o)>0)
     y=y+1;
 end
 b=power250(1,o)+b ;  
end
disp(b);
disp(y);
figure;
bar(h250,power250),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4-2500-channel');

b=0;
for o=1:50
 %b=power50(o,3)+b ;  
end


