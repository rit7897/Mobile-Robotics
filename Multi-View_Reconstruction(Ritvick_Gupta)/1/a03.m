% in this file we are generating P from svd in one frame by taking 4 points
% there will be small1 small2 small3 three images from each  angle
xw=3.4;% side of square in checker board in . world frame
yw=3.4;
image = 'small1.jpg';
subplot(1,1,1);
imshow(image); %opens figure to show image
% i have assumed 4 points as diagonals starting at (3,2) top leftmist is my
% 0,0
x32 = impoint(gca,[]); %gets point
pos32 = x32.getPosition(); %get position of 1st point
pos32(1,1) = pos32(1,1)/100;pos32(1,2) = pos32(1,2)/100; %converts mm to cm

x43 = impoint(gca,[]); %gets 2 point
pos43 = x43.getPosition(); %get position of 2nd point
pos43(1,1) = pos43(1,1)/100;pos43(1,2) = pos43(1,2)/100; %converts mm to cm

x54 = impoint(gca,[]); %gets 3rd point
pos54 = x54.getPosition(); %get position of 3rd point 
pos54(1,1) = pos54(1,1)/100;pos54(1,2) = pos54(1,2)/100; %converts mm to cm

x65 = impoint(gca,[]); % gets 4th point
pos65 = x65.getPosition();
pos65(1,1) = pos65(1,1)/100;pos65(1,2) = pos65(1,2)/100; %converts mm to cm
% i have solved for P by  MP!=w minimising w using svd 
mat1 = [-(xw*3),-(yw*2),-1,0,0,0,pos32(1,1)*xw*3,pos32(1,1)*yw*2,pos32(1,1)];
mat2 = [0,0,0,-(xw*3),-(yw*2),-1,pos32(1,2)*(xw*3),pos32(1,2)*(yw*2),pos32(1,2)];

mat3 = [-(xw*4),-(yw*3),-1,0,0,0,pos43(1,1)*(xw*4),pos43(1,1)*(yw*3),pos43(1,1)];
mat4 = [0,0,0,-(xw*4),-(yw*3),-1,pos43(1,2)*(xw*4),pos43(1,2)*(yw*3),pos43(1,2)];

mat5 = [-(xw*5),-(yw*4),-1,0,0,0,pos54(1,1)*(xw*5),pos54(1,1)*(yw*4),pos54(1,1)];
mat6 = [0,0,0,-(xw*5),-(yw*4),-1,pos54(1,2)*(xw*5),pos54(1,2)*(yw*4),pos54(1,2)];

mat7 = [-(xw*6),-(yw*5),-1,0,0,0,pos65(1,1)*(xw*6),pos65(1,1)*(yw*5),pos65(1,1)];
mat8 = [0,0,0,-(xw*6),-(yw*5),-1,pos65(1,2)*(xw*6),pos65(1,2)*(yw*5),pos65(1,2)];

Matrix = [mat1;mat2;mat3;mat4;mat5;mat6;mat7;mat8]; %M matrix consists of 8 rows 2 from each point  
[U,S,V] = svd(Matrix); %svd decomposition of M matrix 
final = reshape(V(:,9),3,3)'; % 9 th column will give us the homogeneous matrix becuase in svd S will
% will lowest value in 9 column finally we will get p.