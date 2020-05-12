function Img_Edge = Edge_Detection(Img_Denoise)
%Edge Detection: Roberts Operator
%Operators: roberts, sobel, log, canny, prewitt
Img_Edge = edge(Img_Denoise, 'roberts');  %G[i,j] = |f[i , j] - f[ i+1, j+1]| + |f[i+1, j] - f[i, j+1]|