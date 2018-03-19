function [normalisedPoints, T] = normalise(pts)

[rows,col,~] = size(pts);

ptsCopy = pts(1:rows-1,:);

centrePoints = mean(ptsCopy,2);
centreX = centrePoints(1,1);
centreY = centrePoints(2,1);

transformedPoints = ptsCopy;
for i=1:col
    transformedPoints(:,i) = transformedPoints(:,i)-centrePoints;
end

d = mean(sqrt(sum(transformedPoints.^2)));
scale = sqrt(2)/d;

T = [scale,0,-scale*centreX;
    0,scale,-scale*centreY;
    0,0,1];

normalisedPoints = T*pts;

end

