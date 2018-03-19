function [reprojected] = algebraicTriangulation(x11,x22,P1,P2)

%[cube_pts_world,image_pts,H] = image_function(); 
%R1 = [1 0 0;0 1 0;0 0 1]; %1st Rotation matrix
%R2 = [-1 0 0;0 -1 0;0 0 1]; %2nd Rotation matrix
K = [100 0 50;0 100 100;0 0 1]; %intrinsic matrix
%sb = [0 0 0;0 0 -50;0 50 0]; % baseline vector 
%Fundamental_matrix = (inv(K))'*R1*sb*R2*(inv(K)); %fundamental matrix
%P1 = K*H([1:3],:,1); % projection 1st matrix
%P2 = K*H([1:3],:,2); % 2nd projection matrix
reprojected = [];
for i = 1:size(x11,2)
x1 = x11(1,i); % storing x and y comp of 1st image pts in x1 and y1
y1 = x11(2,i);
x2 = x22(1,i); % storing x and y comp of 2nd image pts in x2 and y2
y2 = x22(2,i);
A = [(x1.*P1(3,:))-P1(1,:);(y1.*P1(3,:))-P1(2,:);(x2.*P2(3,:))-P2(1,:);(y2.*P2(3,:))-P2(2,:)];
[u,d,v] = svd(A);
X = v(:,4); 
%X = X/X(4); %reprojected vector
%X = X([1:3],:);
reprojected = [reprojected,X]; %complete matrix containning reprojection of all pts
end
end