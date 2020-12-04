function [ pathGain ] = FuncRatePlus( pathGain,bound,pMax,PowerMax )
    while(true)
         C=0;
         p=0;
         productPathgain=0;
         for b=1:bound
             if(pathGain(b,3)>-1 && pathGain(b,3)~=PowerMax)
                productPathgain=productPathgain+(1/pathGain(b,2));
                C=C+1;
             end
         end
         landa=((productPathgain+pMax)*(1/C));

         for q=1:bound
             if(pathGain(q,3)>-1 && pathGain(q,3)~=PowerMax)
                P_k=landa-(1/pathGain(q,2));
                if(P_k>=0)
                   pathGain(q,3)=P_k;
                   p=p+1;
                else
                   pathGain(q,3)=-1; 
                   break;
                end
             end
         end
         if(p==C)
             break;
         end

    end
end

