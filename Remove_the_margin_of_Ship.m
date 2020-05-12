function [Dilate_New_Img, jg_recreate] = Remove_the_margin_of_Ship (Localization)
%Removing the margin of Ship
[m1, n1] = size(Localization);
white_pixel = 1;
first_location = [];
last_location = [];
jg = Localization;
jg_new = uint8(Localization);

%Find the first and Last White Pixel and Save the Index 
for i = 1:m1
    for j = 1:n1
        if jg(i, j) == 0
            random_pixel = randi(224)+1;   
            jg_new(i, j) = random_pixel;
        end
        pixel_line = uint8(jg_new(i, :));
        [white_pixel ,index_first] = unique (pixel_line);  %Find the First White Pixel Using unique()
        [white_pixel, index_last]  = unique (pixel_line, 'legacy'); %Find the Last White Pixel using unique( ***,'legacy' )
        first_location(i) = index_first(1);
        last_location(i)  = index_last(1);
    end
end

first_coordinate = [];
last_coordinate = [];
line = 1:1:m1;
first_coordinate = [line', first_location'];  %Save the First Index
last_coordinate  = [line',  last_location'];  %Save the Last Index
            
%Margin of Ship
jg_recreate = jg;
for i = 1:m1
    for j = 1:n1
        if jg_recreate(i, j) ~= 0
            jg_recreate(i, j) = 0;
        end
        jg_recreate(first_coordinate(i, 1), first_coordinate(i, 2)) = 1;  %Highlight the First Side (Left) White Margin
        jg_recreate(last_coordinate(i, 1),  last_coordinate(i, 2)) = 1;  %Highlight the Last Side (Right) White Margin
    end
end

%Removing Margin of Ship ------> Change the Cycle 8 pixels into Black (0)
Dilate_New_Img = jg;
for i = 1:m1
    Dilate_New_Img(first_coordinate(i, 1), first_coordinate(i, 2)) = 0;
    Dilate_New_Img(first_coordinate(i, 1)+1, first_coordinate(i, 2)) = 0;
    Dilate_New_Img(first_coordinate(i, 1), first_coordinate(i, 2)+1) = 0;
    Dilate_New_Img(first_coordinate(i, 1)+1, first_coordinate(i, 2)+1) = 0;
    
    Dilate_New_Img(last_coordinate(i, 1),  last_coordinate(i, 2))  = 0;
    Dilate_New_Img(last_coordinate(i, 1)+1,  last_coordinate(i, 2))  = 0;
    Dilate_New_Img(last_coordinate(i, 1),  last_coordinate(i, 2)+1)  = 0;
    Dilate_New_Img(last_coordinate(i, 1)+1,  last_coordinate(i, 2)+1)  = 0;
    
    if i > 1
        Dilate_New_Img(first_coordinate(i, 1)-1, first_coordinate(i, 2)) = 0;
        Dilate_New_Img(last_coordinate(i, 1)-1,  last_coordinate(i, 2))  = 0;
        
        if first_coordinate(i, 2) > 1
            Dilate_New_Img(first_coordinate(i, 1), first_coordinate(i, 2)-1) = 0;
            Dilate_New_Img(first_coordinate(i, 1)-1, first_coordinate(i, 2)-1) = 0;
        end
        
        if last_coordinate(i, 2) > 1
            Dilate_New_Img(last_coordinate(i, 1),  last_coordinate(i, 2)-1)  = 0;
            Dilate_New_Img(last_coordinate(i, 1)-1,  last_coordinate(i, 2)-1)  = 0;
        end
    end
end
