%8 pt algorithm for fundamental matrix calculation

function [F] = fundmatrix(y1,y2) 
    x1 = y1; %storing image correspondicied in x1 and 2nd image in x2  
    x2 = y2;
    [x1, T1] = normalise2dpts(x1); % normalizing x1 and x2
    [x2, T2] = normalise2dpts(x2);    
for i = 1:8 
    A(i,:) =  (kron(x2(:,i),x1(:,i)))'; % taking kroniker product of x1 and x2
end
	[U,D,V] = svd(A);  %taking single value decomposition of matrix A
    F = reshape(V(:,9),3,3)'; %taking last col of v and reshaping in 3*3 matrix
    [U,D,V] = svd(F);
    F = U*diag([D(1,1) D(2,2) 0])*V'; %making F matrix of rank 2 forcefully
    F = T2'*F*T1; %final F matrix by reinverting change due to normalizing pts
end
    
   