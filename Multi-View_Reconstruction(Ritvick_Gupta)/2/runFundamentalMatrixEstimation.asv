clc;
clear all;
close all;

pathImage1 = input('Path to Image 1\n');
pathImage2 = input('Path to Image 2\n');

Image1 = imread(pathImage1);
Image2 = imread(pathImage2);

[~,~,k] = size(Image1);
if(k>1)
    Image1 = rgb2gray(Image1);
end

[~,~,k] = size(Image2);
if(k>1)
    Image2 = rgb2gray(Image2);
end

Image1 = im2double(Image1);
Image2 = im2double(Image2);

points1 = detectSURFFeatures(Image1);
points2 = detectSURFFeatures(Image2);

[featuresImage1,vpts1] = extractFeatures(Image1,points1);
[featuresImage2,vpts2] = extractFeatures(Image2,points2);

indexPairs = matchFeatures(featuresImage1,featuresImage2) ;
matchedPoints1 = vpts1(indexPairs(:,1));
matchedPoints2 = vpts2(indexPairs(:,2));

pts1 = matchedPoints1.Location;
pts2 = matchedPoints2.Location;

pts1 = pts1';
pts2 = pts2';

pts1 = [pts1;ones(1,size(pts1,2))];
pts2 = [pts2;ones(1,size(pts2,2))];


fRANSAC = estimateFundamentalMatrix(pts1,pts2);