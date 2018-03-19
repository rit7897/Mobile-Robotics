clc;
arr=zeros(3,8);% each column stores camera coordinates starting from 25,0,0
%we are dividing the circle starting on x-axis ,so calculating respective
%angles
for i= 1:8
    arr(1,i)=25*cosd((45*i)-45);
    arr(2,i)=25*sind((45*i)-45);
    arr(3,i)=0;
end
h=zeros(4,4,8);
%Projection matrix of 4X4 is formed

for i= 1:8
    h(1,1,i)=cosd(45+45*i);  h(1,2,i)=cosd(45*i-45); h(1,3,i)=0; h(1,4,i)=-arr(1,i);    
    
    h(2,1,i)=cosd(135+45*i); h(2,2,i)=cosd(45+45*i); h(2,3,i)=0; h(2,4,i)=-arr(2,i);
    
    h(3,1,i)=0;h(3,2,i)=0;h(3,3,i)=1;  h(3,4,i)=0;
    
    h(4,1,i)=0; h(4,2,i)=0; h(4,3,i)=0; h(4,4,i)=1;
end
for i= 1:8
    for j= 1:4
        cube_pts_cam(:,j,i)= squeeze(h(:,:,i))*x1(:,j); 
    end
end
cube_pts_cam=cube_pts_cam(1:3,:,:);%to remove unnecessary 1's at the end

K=[100,0,50;
   0,100,100;
   0,0,1];%K=Intrinsic matrix of camera
for i= 1:8  
    for j= 1:4
        image_pts(:,j,i)=K*cube_pts_cam(:,j,i)*(1/cube_pts_cam(3,j,i));
    end
end
image_pts=image_pts(1:2,:,:);%to remove unnecessary 1's at the end
for i=1:8
    subplot(4,2,i);
    a=image_pts(1,:,i);
    b=image_pts(2,:,i);
    scatter(a,b);%creates a scatter plot with circles at the locations specified by the vectors a,b
end