%function for normalising pts 
function [normalized_pts Transformation] = normalise2dpts(pts)
    pts(1,:) = pts(1,:)./pts(3,:); %converting into 2-d from homogeneous coordinates
    pts(2,:) = pts(2,:)./pts(3,:);
    pts(3,:) = 1;
    mu1 = mean(pts(1,:)); %calculating x and y means in mu1 and mu2
    mu2 = mean(pts(2,:));
    newp(1,:) = pts(1,:)-mu1; 
    newp(2,:) = pts(2,:)-mu2;
    dist = sqrt(newp(1,:).^2 + newp(2,:).^2);
    meandist = mean(dist(:));   
    scale = sqrt(2)/meandist; %calculating scale factor
    Transformation = [scale   0   -scale*mu1 %calculating transformation matrix that converts
         0     scale -scale*mu2  %pts to normalized pts
         0       0      1      ];
    
    normalized_pts = Transformation*pts; %normalized pts
end