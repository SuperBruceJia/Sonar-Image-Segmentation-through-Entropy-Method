# Sonar Image Segmentation via Entropy Method

Author: Shuyue Jia and Ziyu Huo @ Human Sensor Laboratory, School of Automation Engineering, Northeast Electric Power University, Jilin, China.

Date: June of 2018

# 🎉 News
[2020] ![](figures/news.gif) A [𝗣𝗮𝘁𝗲𝗻𝘁](https://patents.google.com/patent/CN112164079A/en) is published based on this project and repo codes. 

# Read the Original Shipwrecked Sonar Image

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/sonar_original.jpg)

# Gray the Image

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/Img_gray.jpg)

# Denoise the Image: DCT (Discrete Cosine Transform) Denoise

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/Img_Denoise.jpg)

# Edge Detection (Roberts Operator)

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/Img_Edge.jpg)

# Removing Shadow Boundaries

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/Removing_Shadow_Boundaries.jpg)

# Image Localization (Threshold)

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/Localization.jpg)

# Remove Ship Boundaries

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/Dilate_New_Img.jpg)

# Image Dilate White Pixel (Morphology Dilation)

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/Img_Dilate.jpg)

# Merge Denoise & Dilation Images

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/Expanded_Image.jpg)

# 2-D Entropy Segamentation

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/Img_Entropy.jpg)

# Postprocessing

![](https://github.com/SuperBruceJia/Sonar-Image-Segmentation-through-Entropy-Method/raw/master/Final_Image.jpg)
