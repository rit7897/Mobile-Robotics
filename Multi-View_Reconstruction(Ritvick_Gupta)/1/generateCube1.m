function arr = generateCube1(N,A)
    diff=N/(A-1);% diff between two nearby points
    z=-A/2;un=1;
    for z = -A/2:diff:A/2
        if z == -A/2 || z == A/2
        for y = -A/2:diff:A/2
            for x = -A/2:diff:A/2
               arr(1,un)=x;arr(2,un)=y;arr(3,un)=z; 
               un=un+1;
            end
        end
        else
                  arr(1,un)=-A/2;   arr(2,un)=-A/2 ;  arr(3,un)=z;
                  arr(1,un+1)=-A/2; arr(2,un+1)=A/2;  arr(3,un+1)=z;
                  arr(1,un+2)=A/2;  arr(2,un+2)=-A/2; arr(3,un+2)=z;
                  arr(1,un+3)=A/2;  arr(2,un+3)=A/2;  arr(3,un+3)=z;
                  
                  arr(1,un+4)=A/2;  arr(2,un+4)=0;    arr(3,un+4)=z;
                  arr(1,un+5)=-A/2; arr(2,un+5)=0;    arr(3,un+5)=z;
                  arr(1,un+6)=0;    arr(2,un+6)=A/2;  arr(3,un+6)=z;
                  arr(1,un+7)=0;    arr(2,un+7)=-A/2; arr(3,un+7)=z;
                  
                  un=un+8;
                  
        end
    end
end
        