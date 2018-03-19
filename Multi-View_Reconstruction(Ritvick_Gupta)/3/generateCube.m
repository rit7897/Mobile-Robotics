function cube_pts_world  = generateCube(N,A)
cube_pts_world=[]; %Initialize the answer to empty array
diff = A/(N-1); %Compute the distance between  two points
z = A/2; %Initialize z coordinate to A/2
y = A/2; %Initialize y coordinate to A/2
x = A/2; %initialize x coordinate to A/2

%In the below we z from A/2 to -A/2 and similary for y ans x .When z or y
%is either end points we need all points
% But when z is between A/2 ans -A/2 we only surface points the if condition takes care of that

while z >= -A/2 
    y = A/2;
    while y >= -A/2
        x = A/2;
        if abs(y-A/2)<0.0000001 || abs(y+A/2)<0.00000001 || abs(z-A/2)<0.00000001 || abs(z+A/2)<0.00000001
            while x>=-A/2
                temp = [x;y;z];
                cube_pts_world = horzcat(cube_pts_world,temp);
                x = x-diff;
            end
        else
            temp = [A/2;y;z];
            cube_pts_world = horzcat(cube_pts_world,temp);
            temp = [-A/2;y;z];
            cube_pts_world = horzcat(cube_pts_world,temp);
        end
        y = y-diff;
    end
    z = z-diff;
end
end

