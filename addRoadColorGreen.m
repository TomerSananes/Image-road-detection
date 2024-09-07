function [newImage] = addRoadColorGreen(mask, originalImage)

newImage = originalImage;
newImage(:,:,1)=newImage(:,:,1).*uint8(~mask);
newImage(:,:,3)=newImage(:,:,3).*uint8(~mask);

end