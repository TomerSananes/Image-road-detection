function [newImage] = addoffRoadColorBlue(mask, originalImage)

newImage = originalImage;
newImage(:,:,1)=newImage(:,:,1).*uint8(~mask);
newImage(:,:,2)=newImage(:,:,2).*uint8(~mask);

end