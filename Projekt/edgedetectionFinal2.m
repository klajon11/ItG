%Vergleiche verschieden Kantendetektion miteinander
clear all
pkg load image
img = imread("control30septCell.jpg");
R = img(:,:,1);

i_values = [0.01 0.02 0.03 0.04 0.045 0.05 0.055 0.06 0.065 0.07];

methods = {"Sobel", "Prewitt", "Kirsch", "Canny", "LoG"};

se = strel("disk", 5, 0);

areas_max = zeros(length(methods), length(i_values));


figure(1)
plot_index = 1;
for m = 1:length(methods)
    method = methods{m};
    for k = 1:length(i_values)
        i = i_values(k);

        [bw, thresh] = edge(R, method, i);
        closed  = imclose(bw, se);
        filled  = imfill(closed, "holes");
        cleaned = bwareaopen(filled, 450);

        [labeled, num] = bwlabel(cleaned);
        stats = regionprops(labeled, "Area");

        if isempty(stats)
            max_area = 0;
        else
            max_area = max([stats.Area]);
        end

        areas_max(m, k) = max_area;

        subplot(length(methods), length(i_values), plot_index)
        imshow(cleaned)
        title(sprintf("%s  i=%.3f", method, i))
        plot_index++;

    end
end

figure(2)
hold on
colors = {'r','g','b','m','k'};  % Farben
for m = 1:length(methods)
    plot(i_values, areas_max(m,:), '-o', ...
         'Color', colors{m}, ...
         'LineWidth', 2);
end

xlabel('Schwellwert i')
ylabel('Maximale Fläche')
title('Maximale Fläche in Abhängigkeit von i')
legend(methods, 'Location', 'best')
grid on
hold off
