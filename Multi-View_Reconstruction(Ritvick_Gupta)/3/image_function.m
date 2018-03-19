function [cube_pts_world,image_pts,H] = image_function()
H=[]; %Homgoenous Matrix
R = []; %Rotation Matrix
cube_pts_world  = generateCube(4,4); %generating the Cube with N =4 & A =4
for i = 0:7 %Fillin the Homogneous matrix H1...H8 from 8 different points
    R = [cosd(90+i*45),0,sind(90+i*45),0;
        0,1,0,0;
        -sind(90+i*45),0,cosd(90+i*45),25];
    H = cat(3,H,[R;
        0,0,0,1]);
end
cube_pts_cam=[];
for i=1:size(cube_pts_world,2)  %Converting each point in the cube to camera coordinates
    temp_pts_cam =[];
    temp = cube_pts_world(:,i);
    temp = [temp;1];
    for j =1:8
        temp_pts_cam=[temp_pts_cam;(H(:,:,j)*temp)'];
    end
    temp_pts_cam = temp_pts_cam(:,1:3);
    cube_pts_cam = cat(3,cube_pts_cam,temp_pts_cam);
end

K = [100,0,50;
    0,100,100;
    0,0,1]; %Intrinsic Matrix

image_pts = [];

for i =1:size(cube_pts_cam,1) %Converting from Camera corrdinaters to image plane coordinates
    temp_pts_2D =[];
    for j=1:size(cube_pts_cam,3)
        temp =(K*(cube_pts_cam(i,:,j))');
        temp = (temp/temp(3,1))';
        temp = temp(:,1:2);
        temp_pts_2D= cat(3,temp_pts_2D,temp);
    end
    image_pts = [image_pts;temp_pts_2D]; %containning images 1 and 5
end 
end