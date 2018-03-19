function f = ransacEstimation(pts1,pts2)

[~,n,~] = size(pts1);
threshold = 0.02;
p = 0.99;
e =0.66;
s =8;

maxNumberOfIteration = log(1-p)/log(1-(1-e).^s);

maxInliers =0;
indices =[];

for i=1:maxNumberOfIteration
    ind = randperm(n,8);
    tempf = estimateFundamentalMatrix(pts1(:,ind),pts2(:,ind));
 
    tempNumberofCorrectMatch =0;
    tempMatchedIndex =[];
    
    for j=1:n
        tempVal = pts2(:,j)'*tempf*pts1(:,j);
        if(abs(tempVal) <threshold)
            tempNumberofCorrectMatch = tempNumberofCorrectMatch+1;
            tempMatchedIndex = [tempMatchedIndex;j];
        end
    end
    
    if tempNumberofCorrectMatch == n
        maxInliers = n;
        indices = tempMatchedIndex;
        break;
    end
    
    if tempNumberofCorrectMatch > maxInliers
        maxInliers = tempNumberofCorrectMatch;
        indices = tempMatchedIndex;
    end
end

inliers1 = pts1(:,indices);
inliers2 = pts2(:,indices);
f = estimateFundamentalMatrix(inliers1,inliers2);
end



