clear all
pkg load image
img = imread("control30septCell.jpg");

R = img(:,:,1);

figure
i= 0.04;
  [bwSobel, thresh]= edge(R, "Sobel", i);
  se = strel("disk", 5, 0);
  closed = imclose(bwSobel, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 450);
  subplot(5,4,1), imshow(bwSobel)
  title(sprintf("Sobel, i = %d", i))
  subplot(5,4,2), imshow(closed)
  subplot(5,4,3), imshow(filled)
  subplot(5,4,4), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasSobel = [stats.Area];



i= 0.04;
  [bwPrewitt, thresh]= edge(R, "Prewitt", i);
  se = strel("disk", 5, 0);
  closed = imclose(bwPrewitt, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 450);
  subplot(5,4,5), imshow(bwPrewitt)
  title(sprintf("Prewitt, i = %d", i))
  subplot(5,4,6), imshow(closed)
  subplot(5,4,7), imshow(filled)
  subplot(5,4,8), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasPrewitt = [stats.Area];



i = 0.03;
  [bwKirsch, thresh]= edge(R, "Kirsch", i);
  se = strel("disk", 5, 0);
  closed = imclose(bwKirsch, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 450);
  subplot(5,4,9), imshow(bwKirsch)
  title(sprintf("Kirsch, i = %d", i))
  subplot(5,4,10), imshow(closed)
  subplot(5,4,11), imshow(filled)
  subplot(5,4,12), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasKirsch = [stats.Area];



i =0.06;
  [bwCanny, thresh]= edge(R, "Canny", i);
  se = strel("disk", 5, 0);
  closed = imclose(bwCanny, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 450);
  subplot(5,4,13), imshow(bwCanny)
  title(sprintf("Canny, i = %d", i))
  subplot(5,4,14), imshow(closed)
  subplot(5,4,15), imshow(filled)
  subplot(5,4,16), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasCanny = [stats.Area];


i = 0.015;
  [bwLoG, thresh]= edge(R, "LoG", i);
  se = strel("disk", 5, 0);
  closed = imclose(bwLoG, se);
  filled = imfill(closed, "holes");
  cleaned = bwareaopen(filled, 450);
  subplot(5,4,17), imshow(bwLoG)
  title(sprintf("LoG, i = %d", i))
  subplot(5,4,18), imshow(closed)
  subplot(5,4,19), imshow(filled)
  subplot(5,4,20), imshow(cleaned)
  [labeled, num] = bwlabel(cleaned);
  stats = regionprops(labeled, "Area");
  areasLoG = [stats.Area];


