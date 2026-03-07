clear all
pkg load image
img = imread("trialItgCell.jpg"); #speichert als matrix
size(img)

imshow(img)
#imagesc(img);
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
figure
subplot(3,1,1), imhist(R), title("Histogramm Rot")
subplot(3,1,2), imhist(G), title("Histogramm Grün")
subplot(3,1,3), imhist(B), title("Histogramm Blau")


https://octave.sourceforge.io/image/function/edge.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
pkg load image
img = imread("trialItgCell.jpg"); #speichert als matrix
size(img)
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

R_eq = histeq(R);
G_eq = histeq(G);
B_eq = histeq(B);
#"spreizt" Helligkeitswerte über gesammtes histogramm/gesamten Bereich
img_eq1 = cat(3, R_eq, G_eq, B_eq);
imshow(img_eq1);

figure
subplot(3,1,1), imhist(R_eq), title("Histogramm Rot")
subplot(3,1,2), imhist(G_eq), title("Histogramm Grün")
subplot(3,1,3), imhist(B_eq), title("Histogramm Blau")


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
pkg load image
%speichert als matrix:
img = imread("trialItgCell.jpg");
size(img)

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

%Konvertieren in den Hue-saturation-Value (=hsv)- Raum also Farbton Sättigung Helligkeit
hsv = rgb2hsv(img);
V = hsv(:,:,3); %betrachte Helligkeit

%umwandlung in 8-Bit da HSV-werte zwischen 0-1 liegen aber histeq 0-255 erwartet:
%das ist falsch histeq operiert mit double
V_eq = histeq(im2uint8(V));
%Zurückumformung in double und verwenden in Bild
hsv(:,:,3) = im2double(V_eq);
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
subplot(2,3,1), imhist(R), title("Histogramm Rot") %"spreizt" Helligkeitswerte über gesammtes histogramm/gesamten Bereich
subplot(2,3,2), imhist(G), title("Histogramm Grün")
subplot(2,3,3), imhist(B), title("Histogramm Blau")
subplot(2,3,4), imhist(Req), title("Histogramm Rot neu")
subplot(2,3,5), imhist(Geq), title("Histogramm Grün neu")
subplot(2,3,6), imhist(Beq), title("Histogramm Blau neu")
