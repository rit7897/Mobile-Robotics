function P1 = a01()
clc;
clear all;
close all;
[cube_pts_world,image_pts,H] = image_function;  %calling image function for giving world pts and image_pts
x1 = squeeze(image_pts(1,:,:));
x2 = squeeze(image_pts(2,:,:));
x1 = [x1;ones(1,size(x1,2))];
x2 = [x2;ones(1,size(x2,2))];
[F] = FundamentalMatrix2(x1,x2); %calculating fundamental matrix using two image pts correspondencies
k = [100 0 50;0 100 100;0 0 1]; %intrinsic Matrix
E  = k'*F*k; %Essential Matrix from fundamental matrix
[u,d,v] = svd(E); 
E = u*diag([1,1,0])*v';
[R,T] = decomposeEssentialMatrix(E,x1,x2,k); %decomposing Essential matrix to give R and T matrix
P1 = k*[1 0 0 0;0 1 0 0;0 0 1 0]; %considering P1 = K*[I|O]
P2 = k*[R T]; %consdering P2 = K*[R|T]
[reprojected] = algebraicTriangulation(x1,x2,P1,P2); %algebraic triangulation using image pts and projection matrices
for i = 1 :size(reprojected,2)
    reprojected(:,i) = reprojected(:,i)/reprojected(4,i); %converting homogenous to 3-D pts
end
scatter3(reprojected(1,:),reprojected(2,:),reprojected(3,:)); %plotting 3-d points
xlabel('xaxis');
ylabel('yaxis');
zlabel('zaxis');
x = mean(reprojected(1,:));
y = mean(reprojected(2,:));
z = mean(reprojected(3,:));
P1 = [];
for i = 1:8
X = [reprojected(1,:)-x;reprojected(2,:)-y;reprojected(3,:)-z]; 
pts = squeeze(image_pts(i,:,:)); 
pts = [pts;  ones(1,56)]; 
P1= cat(3,P1,resection(X,pts,k)); %calling resection and storing P matrices in P1
end
end