function Removing_Shadow_Boundaries = Remove_Shadow_Boundary(Img_Edge, Img_Denoise)
%Removing Shadow Boundaries
[m, n] = size(Img_Edge);
Extend_four = ones(m, n+16);
Extend_four_2 = ones(m, n+16);
for i = 1:m
    for j = 1:7
        Extend_four(i, j) = 150;
        Extend_four_2(i,j) = 150;
    end
end
for i = 1:m
    for j = n+8:n+16
        Extend_four(i, j) = 150;
        Extend_four_2(i, j) = 150;
    end
end
for i = 1:m
    for j = 1:n
        Extend_four(i, j+7) = Img_Denoise(i, j);
        Extend_four_2(i, j+7) = Img_Edge(i, j);
    end
end
jiegou = Extend_four_2;
jie2gou = Extend_four_2;
for i = 1:m
    for j = 8:n+8
        if Extend_four_2(i, j) == 1
         jiegou(i,j)=floor((Extend_four(i,j-7)+Extend_four(i,j-6)+Extend_four(i,j-5)+...
             Extend_four(i,j-4)+Extend_four(i,j-3)+Extend_four(i,j-2)+Extend_four(i,j-1))/9);
         jie2gou(i,j)=floor((Extend_four(i,j+7)+Extend_four(i,j+6)+Extend_four(i,j+5)+...
             Extend_four(i,j+4)+Extend_four(i,j+3)+Extend_four(i,j+2)+Extend_four(i,j+1))/7);
        end
    end
end
jiegou = uint8(jiegou);
jie2gou = uint8(jie2gou);
% figure(5)
% imshow(jiegou), title('jiegou')
jiegou1 = jiegou;
for i = 1:m  
    for j = 1:n+8
        if jiegou(i, j) <= 80 && jie2gou(i, j) > 50 && jie2gou(i, j) < 150
            jiegou1(i, j) = 0;
        end
    end
end
% figure(6)
% imshow(jiegou1), title('jiegou1')

Removing_Shadow_Boundaries = jiegou1(: ,8:n+7);
t = graythresh(Removing_Shadow_Boundaries);
Removing_Shadow_Boundaries = im2bw(Removing_Shadow_Boundaries, t);
