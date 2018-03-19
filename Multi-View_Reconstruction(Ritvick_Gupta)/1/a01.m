clc;
clear all;
%prompt = 'Enter N ';
%N = input(prompt);
%prompt = 'Enter A ';
%A = input(prompt);
N=4;A=4; %N=number of points
%A=length of cube
cube_pts_world = generateCube2(N,A);
global x1;
x1 = cube_pts_world; % 4 points will be generated on cube
[m1 n1]=size(x1);
x1(end+1,:) = ones(1,n1);
for i=1:n1
    x(i)= cube_pts_world(1,i);
    y(i)= cube_pts_world(2,i);
    z(i)= cube_pts_world(3,i);
end
scatter3(x,y,z,'filled');%creates a scatter plot with circles at the locations specified by the vectors x,y
                            %z and  fills in the circles.
title('Cube Plot');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');
xlim([-A*0.5 A*0.5]); % sets the x-axis limits for the current axes
ylim([-A*0.5 A*0.5]); % sets the y-axis limits for the current axes
zlim([-A*0.5 A*0.5]); % sets the z-axis limits for the current axes
legend('show');