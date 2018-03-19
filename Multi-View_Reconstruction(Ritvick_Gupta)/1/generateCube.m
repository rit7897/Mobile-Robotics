function arr = generateCube(N,A)
    diff=N/A;% diff between two nearby points 
    arr = zeros(3,N);
    for num = 1:N
        r = (1/N)*randi([-A*0.5*N A*0.5*N],1,3);
        arr(1,num)= r(1,1);
        arr(2,num)= r(1,2);
        arr(3,num)= r(1,3);
        m1 = randi([1 3],1,1); % which coordinates x,y,z to a/2 or -a/2 
        m2 = randi([1,2],1,1); % what value a/2 or -a/2
        if m2 == 1
           arr(m1,num) = A*(0.5);
        else
           arr(m1,num) = A*(-0.5);
        end
    end
end