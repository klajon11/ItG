clear all
pkg load image
img = imread("control30septCell.jpg");

R = img(:,:,1);

figure
for i = 3:7
  [bwSobel, thresh]= edge(R, "Sobel", (i/100));
  se = strel("disk", 4, 0);
  closed = imclose(bwSobel, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 250);
  subplot(4,5,i-2), imshow(bwSobel)
  title(sprintf("Sobel, i = %d", (i/100)))
  subplot(4,5,i+3), imshow(closed)
  subplot(4,5,i+8), imshow(filled)
  subplot(4,5,i+13), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasSobel = [stats.Area];
endfor

figure
for i = 1:5
  [bwPrewitt, thresh]= edge(R, "Prewitt", (i/100));
  se = strel("disk", 4, 0);
  closed = imclose(bwPrewitt, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 250);
  subplot(4,5,i), imshow(bwPrewitt)
  title(sprintf("Prewitt, i = %d", (i/100)))
  subplot(4,5,i+5), imshow(closed)
  subplot(4,5,i+10), imshow(filled)
  subplot(4,5,i+15), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasPrewitt = [stats.Area];
endfor

figure
for i = 1:5
  [bwKirsch, thresh]= edge(R, "Kirsch", (i/100));
  se = strel("disk", 4, 0);
  closed = imclose(bwKirsch, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 250);
  subplot(4,5,i), imshow(bwKirsch)
  title(sprintf("Kirsch, i = %d", (i/100)))
  subplot(4,5,i+5), imshow(closed)
  subplot(4,5,i+10), imshow(filled)
  subplot(4,5,i+15), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasKirsch = [stats.Area];
endfor

figure
for i = 5:10
  [bwCanny, thresh]= edge(R, "Canny", (i/100));
  se = strel("disk", 4, 0);
  closed = imclose(bwCanny, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 250);
  subplot(4,5,i-4), imshow(bwCanny)
  title(sprintf("Canny, i = %d", (i/100)))
  subplot(4,5,i+1), imshow(closed)
  subplot(4,5,i+6), imshow(filled)
  subplot(4,5,i+11), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasCanny = [stats.Area];
endfor

figure
for i = 1:5
  [bwLoG, thresh]= edge(R, "LoG", (i/100));
  se = strel("disk", 4, 0);
  closed = imclose(bwLoG, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 250);
  subplot(4,5,i), imshow(bwLoG)
  title(sprintf("LoG, i = %d", (i/100)))
  subplot(4,5,i+5), imshow(closed)
  subplot(4,5,i+10), imshow(filled)
  subplot(4,5,i+15), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasLoG = [stats.Area];
endfor

figure
for i = 3:7
  [bwRoberts, thresh]= edge(R, "Roberts", (i/100));
  se = strel("disk", 4, 0);
  closed = imclose(bwRoberts, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 250);
  subplot(4,5,i-2), imshow(bwRoberts)
  title(sprintf("LoG, i = %d", (i/100)))
  subplot(4,5,i+3), imshow(closed)
  subplot(4,5,i+8), imshow(filled)
  subplot(4,5,i+13), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasRoberts = [stats.Area];
endfor
