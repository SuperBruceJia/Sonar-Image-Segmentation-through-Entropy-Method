function Img_Denoise = Denoise(Img_gray)
%Denoise: DCT (Discrete Cosine Transform) 
%medfilt2, Lee, Kuan, Frost, wavelets
[m, n] = size(Img_gray); 
Img_Denoise = dct2(Img_gray);  %Discrete Cosine Transform : Noise --> High Frequency --> Low Amplitude
I = zeros(m, n);  
I(1:m/3, 1:n/3) = 1; %Keep Low Frequency Denoise High Frequency
Ydct = Img_Denoise .* I;  %Denoise
Img_Denoise = uint8(idct2(Ydct)); %Inverse Discrete Cosine Transform
