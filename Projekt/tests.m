clear all
pkg load image
img = imread("trialItgCell.jpg");
size(img)
figure
imshow(img)
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

figure
subplot(3,1,1), imhist(R), title("Histogramm Rot")
subplot(3,1,2), imhist(G), title("Histogramm Grün")
subplot(3,1,3), imhist(B), title("Histogramm Blau")

R_eq = histeq(R);
G_eq = histeq(G);
B_eq = histeq(B);
img_eq1 = cat(3, R_eq, G_eq, B_eq);
figure
imshow(img_eq1);

figure
subplot(3,1,1), imhist(R_eq), title("Histogramm Rot")
subplot(3,1,2), imhist(G_eq), title("Histogramm Grün")
subplot(3,1,3), imhist(B_eq), title("Histogramm Blau")
