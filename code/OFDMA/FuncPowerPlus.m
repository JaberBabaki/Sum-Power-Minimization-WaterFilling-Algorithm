function [ pathGainAndPower ] = FuncPowerPlus( pathGainAndPower,RminPower2,bound,powerMax )
    format short;
    while(true)
        C=0;
        p=0;
        productPathgain=1;
        for b=1:bound
            if(pathGainAndPower(b,3)>0 && pathGainAndPower(b,3)~=powerMax)
                productPathgain=productPathgain*pathGainAndPower(b,2);
                C=C+1;
            end
        end
        if(isinf(productPathgain))
           productPathgain= 1.305145884430961e+297-(bound*20000);
        end
        M=RminPower2/productPathgain;
        landa=(M^(1/C));
        for q=1:bound
            if(pathGainAndPower(q,3)>0 && pathGainAndPower(q,3)~=powerMax)
                P_k=landa-(1/pathGainAndPower(q,2));
                if(P_k>=0)                  
                    pathGainAndPower(q,3)=P_k;
                    p=p+1;
                else
                    pathGainAndPower(q,3)=0; 
                    break;
                end
            end
        end
        if(p==C)
            break;
        end

    end
end

