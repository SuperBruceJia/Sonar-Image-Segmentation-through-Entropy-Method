function Expanded_Image = Cover_Denoise_Image(Img_Dilate, Img_Denoise, Removing_Shadow_Boundaries)
%Cover Denoise Original Image
[Localization, yuzhi1, yuzhi2, lyuzhi1, lyuzhi2] = Localization_Ship(Removing_Shadow_Boundaries);
Expanding_Image = Img_Dilate;  %Expanding Image ------> Smaller Image
Expanded_Image = Img_Denoise;  %Expanded Image ------> Bigger Image
[height, width] = size(Expanded_Image);

for line_Expanded_Image = 1:height
    for column_Expanded_Image = 1:width
        for line_Image_Expanding = (yuzhi1+line_Expanded_Image): yuzhi2
            for column_Image_Expanding = (lyuzhi1+column_Expanded_Image): lyuzhi2     
                if Expanding_Image(line_Expanded_Image, column_Expanded_Image) == 1
                    Expanded_Image(yuzhi1+line_Expanded_Image, lyuzhi1+column_Expanded_Image) = 255;
                end
            end
        end
    end
end