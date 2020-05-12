function Img_Entropy = Entropy_Segmentation(Expanded_Image)
% 2-Dimensionality Entropy Segmentation ------> Expanding Image
a = Expanded_Image;  %ES Input Image 
a0=double(a);  
[m,n]=size(a);  
h=1;  
a1=zeros(m,n);  

for i=1:m
    for j=1:n 
        r=0;
        for k=-h:h  
            for w=-h:h
                r=r+1;   
                p=i+k;  
                q=j+w;  
                if (p<=0)||( p>m)  
                    p=i;  
                end  
                if (q<=0)||(q>n)  
                    q=j;  
                end  
                 a1(i,j)=a0(p,q)+a1(i,j); 
                 C(r)=a0(p,q) ;
            end
        end
        
       a2(i,j)=uint8(1/9*a1(i,j));  
       %a2(i,j)= mode(C);
    end  
end  
fxy=zeros(256,256);  

for i=1:m  
    for j=1:n  
        c1=a0(i,j);  
        d=double(a2(i,j));  
        fxy(c1+1,d+1)=fxy(c1+1,d+1)+1;  
    end  
end  
Pxy=fxy/m/n;      
D = padarray(Pxy,[1 1],0,'both');
[mm,nn]=size(D); 
for i=2:mm-1
    for j=2:nn-1
        h(i-1,j-1)=D(i-1,j-1)+D(i-1,j)+D(i-1,j+1)+D(i,j-1)+D(i,j)+D(i,j+1)+D(i+1,j-1)+D(i+1,j)+D(i+1,j+1);
        w(i-1,j-1)=1-h(i-1,j-1)-abs(i-1-j-1)/100;
    end
end

av1=0;
av2=0;
av3=0;
ab=0.5;
pth=0;
pth1=0;
p=zeros(234,216);
p1=zeros(234,216);
aav1=zeros(234,216);
aaav3=zeros(234,216);

for i=4:237
    for j=4:219
        pth=pth+Pxy(i,j);
        p(i,j)=pth;           
    end
end

for i=4:237
    for j=4:219
        p1(i,j)=1-p(i,j);  
    end
end

for i=5:237
    for j=5:219
        av1= av1+(Pxy (i,j)^ab);
        aav1(i,j)=av1;
    end
end

for i=5:230
    for j=5:210
        aaav3(i,j)=aav1(230,210)-aav1(i,j);
    end
end
 
b=0;
b1=0;
tt=0;
ss=0;
tt1=0;
ss1=0;

for s=70:100
    for t=70:100
        for s1=100:150
            for t1=100:150   
                aa1=1/(ab-1)*(1-aav1(s,t)/(p(s,t)^ab));
                aa2=1/(ab-1)*(1-(aav1(s1,t1)-aav1(s,t))/((p(s1,t1)-p(s,t))^ab));
                aa3=1/(ab-1)*(1-aaav3(s1,t1)/(p1(s1,t1)^ab));
                E=(aa1+aa2+aa3)+w(s,t)+w(s1,t1);
                if E>b
                    b=E;
                    ss=s;
                    tt=t;  
                    ss1=s1;
                    tt1=t1;
                else 
                    b=b;
                    ss=ss;
                    tt=tt;
                    ss1=ss1;
                    tt1=tt1;
                end
            end
        end
    end
end

if ss<tt
    turn1=ss;
else
    turn1=tt;
end

ss=turn1;
tt=turn1;
if ss1>tt1
    turn2=ss1;
else
    turn2=tt1;
end
ss1=turn2;   
tt1=turn2; 

I1=zeros(m,n);
for i=1:m  
    for j=1:n  
        if  a0(i,j)>=ss1+50&&a2(i,j)>=tt1+50
            I1(i,j)=255; 
        elseif  a0(i,j)<=ss-50 && a2(i,j)<=tt -50  
            I1(i,j)=0; 
        else
            I1(i,j)=100;
        end
    end
end

ss;
tt;
ss1;
tt1;
Img_Entropy = uint8(I1);