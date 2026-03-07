clear all
pkg load image
%speichert als matrix:
img = imread("trialItgCell.jpg");
n= 0;
m= 1;
size(img)

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

hsv = rgb2hsv(img);
V = hsv(:,:,3); %betrachte Helligkeit

V_eq = histeq(V).*m+n;
hsv(:,:,3) = V_eq;
%Konvertieren zu RGB Bild und anzeigen
img_eq2 = hsv2rgb(hsv);
figure
imshow(img_eq2);

Req01 = img_eq2(:,:,1);
Geq01 = img_eq2(:,:,2);
Beq01 = img_eq2(:,:,3);
Req = im2uint8(Req01);
Geq = im2uint8(Geq01);
Beq = im2uint8(Beq01);

figure
subplot(2,3,1), imhist(R), title("Histogramm Rot")
subplot(2,3,2), imhist(G), title("Histogramm Grün")
subplot(2,3,3), imhist(B), title("Histogramm Blau")
subplot(2,3,4), imhist(Req), title("Histogramm Rot neu")
subplot(2,3,5), imhist(Geq), title("Histogramm Grün neu")
subplot(2,3,6), imhist(Beq), title("Histogramm Blau neu")
