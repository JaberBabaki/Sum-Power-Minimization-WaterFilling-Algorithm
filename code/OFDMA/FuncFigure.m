function FuncFigure( TPC )
    randomPower=TPC{1};
    gamma=TPC{2};
    j=TPC{3};
    x=1:(j);
    figure(1)
    plot(x,randomPower),grid on;
    xlabel('Iteration')
    ylabel('Power')
    title('Plot of Power')
    figure(2)
    plot(x,gamma),grid on;
    xlabel('Iteration')
    ylabel('SINR')
    title('Plot of SINR')
    
end


