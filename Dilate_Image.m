function Img_Dilate = Dilate_Image(Dilate_New_Img)
%Dilate "Removing Boundaries" Image ------>Morphological
tool = strel('disk',3);
Img_Dilate = imdilate(Dilate_New_Img, tool);