function [offRoadMask] = getOffRoadMask(img)

img = imgaussfilt(img,1);
%improve the contras for easy identifying
img = histeq(img);
hsvImg = rgb2hsv(img);  

%get a mask by identifying the color of the 'off-road'
offRoadMask = (hsvImg(:,:,1) >= 0) & (hsvImg(:,:,1) <= 0.3) & ...
             (hsvImg(:,:,2) >= 0) & (hsvImg(:,:,2) <= 0.4) & ...
             (hsvImg(:,:,3) >=0.8) & (hsvImg(:,:,3) <= 1);

end