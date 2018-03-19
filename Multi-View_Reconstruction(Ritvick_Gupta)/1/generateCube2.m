function arr = generateCube2(N,A)
    diff=N/(A-1);% diff between two nearby points
    z=-A/2;un=1;
    for z = -A/2:diff:A/2
        for y = -A/2:diff:A/2
            for x = -A/2:diff:A/2
                if(abs(z)==A/2 || abs(x)==A/2 || abs(y)==A/2)
               arr(1,un)=x;arr(2,un)=y;arr(3,un)=z; 
               un=un+1;
                end
            end
        end
    end
end
        