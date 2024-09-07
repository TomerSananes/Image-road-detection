function [roadMask] = getRoadMask(img)

img = imgaussfilt(img,1);
%improve the contras for easy identifying
img = histeq(img);
hsvImg = rgb2hsv(img);

%get a mask by identifying the color of the 'asphalt road'
roadMask = (hsvImg(:,:,2) >= 0) & (hsvImg(:,:,2) <= 0.1) & ...
           (hsvImg(:,:,3) >= 0) & (hsvImg(:,:,3) <= 0.8) ;
   
end