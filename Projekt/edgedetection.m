clear all
pkg load image
img = imread("control30septCell.jpg");

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

hsv = rgb2hsv(img);
V = hsv(:,:,3); %betrachte Helligkeit

V_eq = histeq(V);
hsv(:,:,3) = V_eq;
%Konvertieren zu RGB Bild und anzeigen
img_eq2 = hsv2rgb(hsv);


Req01 = img_eq2(:,:,1);
Req01 = im2uint8(img_eq2(:,:,1));
[bwCanny, thresh]= edge(R, "Canny");
[bw01Canny, thresh]= edge(Req01, "Canny");

[bwKirsch, thresh]= edge(R, "Kirsch");
[bw01Kirsch, thresh]= edge(Req01, "Kirsch");

[bwLoG, thresh]= edge(R, "LoG");
[bw01LoG, thresh]= edge(Req01, "LoG");

[bwPrewitt, thresh]= edge(R, "Prewitt");
[bw01Prewitt, thresh]= edge(Req01, "Prewitt");

[bwRoberts, thresh]= edge(R, "Roberts");
[bw01Roberts, thresh]= edge(Req01, "Roberts");

[bwSobel, thresh]= edge(R, "Sobel");
[bw01Sobel, thresh]= edge(Req01, "Sobel");

figure
subplot(2,7,1), imshow(img)
title("Original")
subplot(2,7,8), imshow(img_eq2)
title("Kontrasterhöhung")
subplot(2,7,2), imshow(bwCanny)
title("Canny")
subplot(2,7,9), imshow(bw01Canny)
title("Canny")
subplot(2,7,3), imshow(bwKirsch)
title("Kirsch")
subplot(2,7,10), imshow(bw01Kirsch)
title("Kirsch")
subplot(2,7,4), imshow(bwLoG)
title("LoG")
subplot(2,7,11), imshow(bw01LoG)
title("LoG")
subplot(2,7,5), imshow(bwPrewitt)
title("Prewitt")
subplot(2,7,12), imshow(bw01Prewitt)
title("Prewitt")
subplot(2,7,6), imshow(bwRoberts)
title("Roberts")
subplot(2,7,13), imshow(bw01Roberts)
title("Roberts")
subplot(2,7,7), imshow(bwSobel)
title("Sobel")
subplot(2,7,14), imshow(bw01Sobel)
title("Sobel")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#fokuss auf kirsch prewitt und Sobel
clear all
pkg load image
img = imread("control30septCell.jpg");

R = img(:,:,1);
figure
for i = 1:10
  [bwKirsch, thresh]= edge(R, "Kirsch", (i/100));


  subplot(2,5,i), imshow(bwKirsch)
  title(sprintf("Kirsch, i = %d", (i/100)))
endfor
figure
for i = 1:10
  [bwPrewitt, thresh]= edge(R, "Prewitt", (i/100));


  subplot(2,5,i), imshow(bwPrewitt)
  title(sprintf("Prewitt, i = %d", (i/100)))
endfor
figure
for i = 1:10
  [bwSobel, thresh]= edge(R, "Sobel", (i/100));


  subplot(2,5,i), imshow(bwSobel)
  title(sprintf("Sobel, i = %d", (i/100)))
endfor


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%mit den verschiedenen Bildern edgedetection machen
clear all
pkg load image
img = imread("control30septCell.jpg");

R = img(:,:,1);
figure
[bwKirsch, thresh]= edge(R, "Kirsch", (4/100));
imshow(bwKirsch)
se = strel("disk", 4, 0);
closed = imclose(bwKirsch, se);
filled = imfill(closed, "holes");
cleaned = bwareaopen(filled, 250);
figure
subplot(3,1,1), imshow(closed)
subplot(3,1,2), imshow(filled)
subplot(3,1,3), imshow(cleaned)
[labeled, num] = bwlabel(cleaned);
stats = regionprops(labeled, "Area");
areas = [stats.Area];
