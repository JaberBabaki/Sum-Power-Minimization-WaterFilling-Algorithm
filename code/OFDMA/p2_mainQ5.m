clc;   
close all;
clear all;

Chanel=200;
Alfa=3;
Noise=(10^-7);
PowerMax=[0.025, 0.030, 0.035, 0.04, 0.045,0.050];
pMax=0.008;
Pmax25=zeros(1,Chanel);
Pmax30=zeros(1,Chanel);
Pmax35=zeros(1,Chanel);
Pmax40=zeros(1,Chanel);
Pmax45=zeros(1,Chanel);
Pmax50=zeros(1,Chanel);
h25=zeros(1,Chanel);
h30=zeros(1,Chanel);
h35=zeros(1,Chanel);
h40=zeros(1,Chanel);
h45=zeros(1,Chanel);
h50=zeros(1,Chanel);

format long;
for j=1:15
    distnceVector=FuncPosition();
    PowerMax=[0.025, 0.030, 0.035, 0.04, 0.045,0.050];
    for o=1:6
        x = exprnd(1, [1,Chanel]);
        pathGainAndPower=FuncPathGain(distnceVector,x,Alfa);
        pathGain=ones(Chanel,3);
        for i=1:Chanel
            pathGain(i,1)=i;
            pathGain(i,2)=pathGainAndPower(i)/Noise; 
        end
        pathGain = sortrows(pathGain, 2,'descend'); 
        pathGain=FuncRatePlus(pathGain,Chanel,PowerMax(o),pMax);
        %disp(pathGain);
        for p=1:Chanel
            if(pathGain(p,3)> pMax)
                for h=1:Chanel
                    if(pathGain(h,3)==-1)
                        pathGain(h,3)=1;  
                    end
                end
                pathGain(p,3)=pMax;                
                PowerMax(o)=PowerMax(o)-pMax;
                %disp(p1Max);
                pathGain=FuncRatePlus(pathGain,Chanel,PowerMax(o),pMax);
               % disp(pathGain);

            end
        end
        
        for  k=1:Chanel
            if(o==1)
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax25(1,k)=Pmax25(1,k)+pathGain(k,3);
                h25=pathGain(:,1);
                
            elseif(o==2)
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax30(1,k)=Pmax30(1,k)+pathGain(k,3); 
                h30=pathGain(:,1);
            elseif(o==3)
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax35(1,k)=Pmax35(1,k)+pathGain(k,3);
                h35=pathGain(:,1);
            elseif(o==4)
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax40(1,k)=Pmax40(1,k)+pathGain(k,3);
                h40=pathGain(:,1);
            elseif(o==5) 
                if(pathGain(k,3)==-1)
                   pathGain(k,3)=0; 
                end
                Pmax45(1,k)=Pmax45(1,k)+pathGain(k,3);
                h45=pathGain(:,1);
            elseif(o==6)
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
figure;
bar(h25,Pmax25),grid on;
xlabel('chanel');
ylabel('Power');
title('Q5- 0.025');

Pmax30=Pmax30./15;
figure;
bar(h30,Pmax30),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4- 0.030');

Pmax35=Pmax35./15;
figure;
bar(h35,Pmax35),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4- 0.035');
 
Pmax40=Pmax40./15;
figure;
bar(h40,Pmax40),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4- 0.040');

Pmax45=Pmax45./15;
figure;
bar(h45,Pmax45),grid on;
xlabel('chanel');
ylabel('Power');
title('Q4- 0.045');

Pmax50=Pmax50./15;
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