function [roadsImage, fullMask] = mainFunction(originalImage, groundHeightM, groundWidthM)

roadsImage = originalImage;


%convert the real size of the image from meter to pixel 
meterToPixelWidth = groundWidthM / size(originalImage,2);
meterToPixelHeight = groundHeightM / size(originalImage,1);


%road for car need to be at least 2 meter width
roadSizeMask = ones (ceil(2/meterToPixelHeight), ceil(2/meterToPixelWidth));


%get the mask of the roads by the functions
roadMask = getRoadMask(originalImage);
offRoadMask = getOffRoadMask(originalImage);


%road - green
roadMask = imopen(roadMask, roadSizeMask);
roadMask = imclose(roadMask, roadSizeMask);
roadsImage = addRoadColorGreen(roadMask,roadsImage);


%off road - blue
offRoadMask = imopen(offRoadMask, roadSizeMask);
offRoadMask = imclose(offRoadMask, roadSizeMask);
roadsImage = addoffRoadColorBlue(offRoadMask,roadsImage);


fullMask = roadMask+offRoadMask;

end