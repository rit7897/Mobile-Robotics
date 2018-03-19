[P1,image_pts] = called_function();
X = runTriangulatio(P1,image_pts);
function X = runTriangulatio(P,images)
for i=1:56
    temp2 = [];
    for j=1:8
        for k=1:2
           temp = [images(j,k,i)*P(3,1,j)-P(k,1,j),images(j,k,i)*P(3,2,j)-P(k,2,j),images(j,k,i)*P(3,3,j)-P(k,3,j),images(j,k,i)*P(3,4,j)-P(k,4,j)];
           temp2 = [temp2;temp];
        end
    end
    [~,~,V] = svd(temp2);
    X(:,i) = V(1:4,end);   
end
for i = 1:size(X,2)
    X(:,i) = X(:,i)/X(4,i);
end
scatter3(X(1,:),X(2,:),X(3,:));
xlabel('xaxis');
ylabel('yaxis');
zlabel('zaxis');
end


