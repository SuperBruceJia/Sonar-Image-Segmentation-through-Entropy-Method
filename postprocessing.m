function Final_Image = postprocessing(Img_Entropy)
%Filling the Entropy Segmentation Image: Finding the First White and the First Black Pixel Then Merge White Color
[m, n] = size(Img_Entropy);
Img_Entropy1=zeros(m,n);
Final_Image=Img_Entropy;
for i=1:m
    for j=1:n
        if Img_Entropy(i,j)==255
            Img_Entropy1(i,j)=1;
            break;
        end
    end
end
for i=1:m
    for j=1:n
        if Img_Entropy(i,j)==0
            Img_Entropy1(i,j)=1;
            break;
        end
    end
end

 for i=1:m
     he=0;
     he1=0;
   for j=1:n
       he=he+Img_Entropy1(i,j);
       if   he==2    %line with white and  black
           for h=1:n
           he1=he1+Img_Entropy1(i,h);
               if he1==1      %first white 
                  Final_Image(i,h)=255;
               elseif he1==2  %first black
                   break;
               end
           end
       end
   end
 end
