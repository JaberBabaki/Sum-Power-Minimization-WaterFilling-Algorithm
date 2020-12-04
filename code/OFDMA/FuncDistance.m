function [ dis ] = FuncDistance( userJoinBs1,Bs1POSITION)
    A=complex(Bs1POSITION(1),Bs1POSITION(2));
    temp=userJoinBs1(1,1)- A;
    dis(1,1)=abs(temp);  
end

