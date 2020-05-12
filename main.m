clc
clear all

%Read the Original Image
Original_Image = Read_Image('sonar_original.jpg');

%Gray the Image
Img_gray = Gray_Image(Original_Image);

%Denoise the Image
Img_Denoise = Denoise(Img_gray);

%Edge the Image
Img_Edge = Edge_Detection(Img_Denoise);

%Removing  Shadow Boundaries
Removing_Shadow_Boundaries = Remove_Shadow_Boundary(Img_Edge, Img_Denoise);

%Locate the Ship Body
[Localization, yuzhi1, yuzhi2, lyuzhi1, lyuzhi2] = Localization_Ship(Removing_Shadow_Boundaries);

%Remove the margin of Ship
[Dilate_New_Img, jg_recreate] = Remove_the_margin_of_Ship (Localization);

%Dilate the Image
Img_Dilate = Dilate_Image(Dilate_New_Img);

%Cover the Denoise Image With Dilation Image
Expanded_Image = Cover_Denoise_Image(Img_Dilate, Img_Denoise, Removing_Shadow_Boundaries);

% 2-Dimensionality Entropy Segmentation ------> Expanding Image
Img_Entropy = Entropy_Segmentation(Expanded_Image);

%Filling the Entropy Segmentation Image: Finding the First White and the First Black Pixel Then Merge White Color
Final_Image = postprocessing(Img_Entropy);



%Draw Result
figure(1)
subplot(3, 4, 1), imshow(Original_Image), title('Original Image')
subplot(3, 4, 2), imshow(Img_gray), title('Gray Image')
subplot(3, 4, 3), imshow(Img_Denoise), title('Denoise Image (Discrete Cosine Transform)')
subplot(3, 4, 4), imshow(Img_Edge), title('Edge Image (Roberts)')
subplot(3, 4, 5), imshow(Removing_Shadow_Boundaries), title('Remove Shadow Boundaries')
subplot(3, 4, 6), imshow(Localization), title('Ship Localization (Threshold)')
subplot(3, 4, 7), imshow(jg_recreate), title('Ship Boundaries Extraction (Left & Right Pixel)')
subplot(3, 4, 8), imshow(Dilate_New_Img), title('Remove Ship Boundaries')
subplot(3, 4, 9), imshow(Img_Dilate), title('Dilate White Pixel (Morphology Dilation)')
subplot(3, 4, 10), imshow(Expanded_Image), title('Merge Denoise & Dilation Images')
subplot(3, 4, 11), imshow(Img_Entropy), title('2-D Entropy Segamentation')
subplot(3, 4, 12), imshow(Final_Image), title('Postprocessing')

% imwrite(Img_gray, 'Img_gray.jpg')
% imwrite(Img_Denoise, 'Img_Denoise.jpg')
% imwrite(Img_Edge, 'Img_Edge.jpg')
% imwrite(Removing_Shadow_Boundaries, 'Removing_Shadow_Boundaries.jpg')
% imwrite(Localization, 'Localization.jpg')
% imwrite(Dilate_New_Img, 'Dilate_New_Img.jpg')
% imwrite(Img_Dilate, 'Img_Dilate.jpg')
% imwrite(Expanded_Image, 'Expanded_Image.jpg')
% imwrite(Img_Entropy, 'Img_Entropy.jpg')
% imwrite(Final_Image, 'Final_Image.jpg')
























