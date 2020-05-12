function [Localization, yuzhi1, yuzhi2, lyuzhi1, lyuzhi2] = Localization_Ship(Removing_Shadow_Boundaries)
% Localization Ship
%Find Line Location
[m, n]=size(Removing_Shadow_Boundaries);
A = [];
for i = 1:m
    for j = 1:n
        num_white = sum(Removing_Shadow_Boundaries(i, :));
        A(i) = num_white;  
    end
end
A = A./sum(A);
x_axis = 1:1:m;
y_axis = A;
% figure(1)
% bar(x_axis, y_axis) 
B = medfilt1(A,10);
B = medfilt1(B,10);
y_axis2 = B;
% figure(2)
% bar(x_axis, y_axis2) 
Hzy1=zeros(1,m+4);
Hzy1(3:m+2)=y_axis2;
hzyx(1:m+4)=1:1:m+4;
% figure(3)
% bar(hzyx, Hzy1) 
Hzy2=Hzy1;
tt=0;
for i=3:m+2
    Hzy2(i)=(Hzy1(i-2)+Hzy1(i-1)+Hzy1(i)+Hzy1(i+1)+Hzy1(i+2))/5;
    if Hzy2(i)>tt
        tt=Hzy2(i);
        tt1=i;
    end
end 
% figure(4)
% bar(hzyx, Hzy2) 
tt2=10;
tt3=10;
for i=3:m+2
    if Hzy2(i)<=tt2  && i<tt1
        tt2=Hzy2(i);  
        yuzhi1=i;
    end
    if Hzy2(i)<tt3  && i>tt1
        tt3=Hzy2(i); 
        yuzhi2=i;
    end
end

%  Find Column Location
[m, n]=size(Removing_Shadow_Boundaries);
A = [];
for i = 1:n
    for j = 1:m
        num_white = sum(Removing_Shadow_Boundaries(:, i));
    end
        A(i) = num_white;  
end
A = A./sum(A);
% x_axis = 1:1:n;
% y_axis = A;
% bar(x_axis, y_axis) 
B = medfilt1(A,10);
B = medfilt1(B,10);
B = medfilt1(B,10);
B = medfilt1(B,10);
y_axis2 = B;
% figure(2)
% bar(x_axis, y_axis2) 
Hzy1=zeros(1,n+4);
Hzy1(3:n+2)=y_axis2;
hzyx(1:n+4)=1:1:n+4;
% figure(3)
% bar(hzyx, Hzy1) 
Hzy2=Hzy1;
tt=0;
for i=3:m+2
    Hzy2(i)=(Hzy1(i-2)+Hzy1(i-1)+Hzy1(i)+Hzy1(i+1)+Hzy1(i+2))/5;
    if Hzy2(i)>tt
        tt=Hzy2(i);
        tt1=i;
    end
end 
% figure(4)
% bar(hzyx, Hzy2) 
tt2=10;
tt3=10;
for i=3:m+2
    if Hzy2(i)<=tt2  && i<tt1
        tt2=Hzy2(i);  
        lyuzhi1=i;
    end
    if Hzy2(i)<tt3  && i>tt1
        tt3=Hzy2(i);  
        lyuzhi2=i;
    end
end

%Localization Ship
Localization=Removing_Shadow_Boundaries(yuzhi1:yuzhi2, lyuzhi1:lyuzhi2);