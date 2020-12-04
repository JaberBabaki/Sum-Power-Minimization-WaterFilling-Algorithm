clc;   
close all;
clear all;

Alfa=3;
Noise=(10^-7);
PowerMax=[0.025, 0.030, 0.035, 0.04, 0.045,0.050];
Pmax25=zeros(1,200);
Pmax30=zeros(1,200);
Pmax35=zeros(1,200);
Pmax40=zeros(1,200);
Pmax45=zeros(1,200);
Pmax50=zeros(1,200);
h25=zeros(1,200);
h30=zeros(1,200);
h35=zeros(1,200);
h40=zeros(1,200);
h45=zeros(1,200);
h50=zeros(1,200);

format long;
for j=1:15
    distnceVector=FuncPosition();
    for o=1:6
        x = exprnd(1, [1,200]);
        pathGainAndPower=FuncPathGain(distnceVector,x,Alfa);
        pathGain=ones(200,3);
        for i=1:200
            pathGain(i,1)=i;
            pathGain(i,2)=pathGainAndPower(i)/Noise; 
        end
        pathGain = sortrows(pathGain, 2,'descend'); 
        pathGain=FuncRatePlus(pathGain,200,PowerMax(o),0.0000876);
        for  k=1:200
            if(PowerMax(o)==0.025)
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax25(1,k)=Pmax25(1,k)+pathGain(k,3);
                h25=pathGain(:,1);
                
            elseif(PowerMax(o)==0.030)
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax30(1,k)=Pmax30(1,k)+pathGain(k,3); 
                h30=pathGain(:,1);
            elseif(PowerMax(o)==0.035)
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax35(1,k)=Pmax35(1,k)+pathGain(k,3);
                h35=pathGain(:,1);
            elseif(PowerMax(o)==0.04)
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax40(1,k)=Pmax40(1,k)+pathGain(k,3);
                h40=pathGain(:,1);
            elseif(PowerMax(o)==0.045) 
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax45(1,k)=Pmax45(1,k)+pathGain(k,3);
                h45=pathGain(:,1);
            elseif(PowerMax(o)==0.050)
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax50(1,k)=Pmax50(1,k)+pathGain(k,3);
                h50=pathGain(:,1);
            end
        end
    end
end

disp(pathGain);

Pmax25=Pmax25./15;
b=0;
y=0;
for o=1:250
 if( Pmax25(1,o)>0)
     y=y+1;
 end
 b=b+log2(1+Pmax25) ;  
end
disp(b);
disp(y);
figure;
bar(h25,Pmax25),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4- 0.025');

Pmax30=Pmax30./15;
b=0;
y=0;
for o=1:250
 if( Pmax30(1,o)>0)
     y=y+1;
 end
 b=b+log2(1+Pmax30) ;  
end
disp(b);
disp(y);
figure;
bar(h30,Pmax30),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4- 0.030');

Pmax35=Pmax35./15;
b=0;
y=0;
for o=1:250
 if( Pmax35(1,o)>0)
     y=y+1;
 end
 b=b+log2(1+Pmax35) ;  
end
disp(b);
disp(y);
figure;
bar(h35,Pmax35),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4- 0.035');
 
Pmax40=Pmax40./15;
b=0;
y=0;
for o=1:250
 if( Pmax40(1,o)>0)
     y=y+1;
 end
 b=b+log2(1+Pmax40) ;  
end
disp(b);
disp(y);
figure;
bar(h40,Pmax40),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4- 0.040');

Pmax45=Pmax45./15;
b=0;
y=0;
for o=1:250
 if( Pmax45(1,o)>0)
     y=y+1;
 end
 b=b+log2(1+Pmax45) ;  
end
disp(b);
disp(y);
figure;
bar(h45,Pmax45),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4- 0.045');

Pmax50=Pmax50./15;
b=0;
y=0;
for o=1:250
 if( Pmax50(1,o)>0)
     y=y+1;
 end
 b=b+log2(1+Pmax50) ;  
end
disp(b);
disp(y);
figure;
bar(h50,Pmax50),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4- 0.050');

b=0;
for o=1:5
 %disp(f(1,o));
 %b=pathGain(o,3)+b ;  
end
%disp(b);