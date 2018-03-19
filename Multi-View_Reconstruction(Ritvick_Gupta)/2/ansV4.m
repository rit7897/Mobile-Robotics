clc;
clear all;
close all;

% Getting the Fundamental Matrix
K = [100,0,50;
    0,100,100;
    0,0,1];
K_inv_t = transpose(inv(K));
R_one = [ 0, 0, 1;
          0, 1, 0;
         -1, 0, 0 ];
R_two = [ 0, 0,-1;
          0, 1, 0;
          1, 0, 0 ];          
R_two_t = transpose(R_two);
sb = [ 0,  0,  0;
       0,  0, 50;
       0,-50,  0 ];
F_Matrix = K_inv_t*R_one*sb*R_two_t*K_inv;

% Loading Image Frame Points from 1st and 5th camera.
load('image15.mat');
image1_x = (image15(1,1,:)-50);
image1_y = (image15(1,2,:)-100);
image2_x = (image15(2,1,:)-50);
image2_y = (image15(2,2,:)-100);

% figure;
% subplot(1,2,1);
% scatter(image1_x,image1_y,'filled');
% xlim([-0.1,0.1]);
% ylim([-0.1,0.1]);
% subplot(1,2,2);
% scatter(image2_x,image2_y,'filled');
% xlim([-0.1,0.1]);
% ylim([-0.1,0.1]);


% Generating Projection Matrix for the 1st and 5th frame respectively.
P1 = [ 0, 0, 1, 0;
       0, 1, 0, 0;
      -1, 0, 0, 25;
       0, 0, 0, 1 ];
     
P2 = [  0, 0,-1,  0;
        0, 1, 0,  0;
        1, 0, 0, 25;
        0, 0, 0,  1 ];

H = [];
X = [];
Y = [];
Z = [];
% Calculating the 3D coordinates using Triangulation.
for i=1:56
    p1_x = image1_x(i);
    p1_y = image1_y(i);
    p2_x = image2_x(i);
    p2_y = image2_y(i);
    %disp(size(ptemp_x));
    A = [p1_x*P1(3,1)-P1(1,1),p1_x*P1(3,2)-P1(1,2),p1_x*P1(3,3)-P1(1,3),p1_x*P1(3,4)-P1(1,4);
        p1_y*P1(3,1)-P1(2,1),p1_y*P1(3,2)-P1(2,2),p1_y*P1(3,3)-P1(2,3),p1_y*P1(3,4)-P1(2,4);
        p2_x*P2(3,1)-P2(1,1),p2_x*P2(3,2)-P2(1,2),p2_x*P2(3,3)-P2(1,3),p2_x*P2(3,4)-P2(1,4);
        p2_y*P2(3,1)-P2(2,1),p2_y*P2(3,2)-P2(2,2),p2_y*P2(3,3)-P2(2,3),p2_y*P2(3,4)-P2(2,4)];
    [U,S,V] = svd(A);
    Coordinates_3D = V(1:4,end);
    Coordinates_3D = Coordinates_3D / Coordinates_3D(4,1);
    X(i) = Coordinates_3D(1,1);
    Y(i) = Coordinates_3D(2,1);
    Z(i) = Coordinates_3D(3,1);
end
points3D = [X;Y;Z];

% Display 3D coordinates.
figure;
scatter3(X,Y,Z,'filled');
xlabel('x axis');
ylabel('y axis');
zlabel('z axis');
title('Display 3D cube');



