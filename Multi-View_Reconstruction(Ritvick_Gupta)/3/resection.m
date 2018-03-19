function P = resection(X,pts,K)
pts1 = pts;
A = [];
for i= 1:56
    temp_x = [-1*(X(1,i)),-1*(X(2,i)),-1*(X(3,i)),-1,0,0,0,0,pts1(1,i)*X(1,i),pts1(1,i)*X(2,i),pts1(1,i)*X(3,i),pts1(1,i)];
    temp_y = [0,0,0,0,-1*(X(1,i)),-1*(X(2,i)),-1*(X(3,i)),-1,pts1(2,i)*X(1,i),pts1(2,i)*X(2,i),pts1(2,i)*X(3,i),pts1(2,i)];
    A = [A;temp_x;temp_y];
end
[~,~,V] = svd(A);
P = reshape(V(:, end), 4, 3)';
P = P/P(3,4);
end