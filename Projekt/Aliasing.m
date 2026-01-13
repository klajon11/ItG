%Aliasing & Antialiasing | Radialer Cosinus

%% ----------
%Originalbild mit 500x500Pixel Abstandscosinus mit wachsender räumlicher Frequenz

N = 500;

x = linspace(-2*pi, 2*pi, N);
y = linspace(-2*pi, 2*pi, N);
[X, Y] = meshgrid(x, y);

% Räumliche Frequenz
f = 10;   % je größer, desto mehr Aliasing später

% Abstandscosinus
R = sqrt(X.^2 + Y.^2);
original = cos(f * R);

% Plot
%figure
%imagesc(original)
%axis image off
%colormap gray
%title('Originalbild (Cosinus, hohe Auflösung)')


%% ----------
% Sampling des Originalbildes auf 19x19

x19 = linspace(-2*pi, 2*pi, 19);
y19 = linspace(-2*pi, 2*pi, 19);
[X19, Y19] = meshgrid(x19, y19);
sampled19 = interp2(X, Y, original, X19, Y19, 'nearest');


%% ---------
%Sampling des Originalbildes auf 13x13

x13 = linspace(-2*pi, 2*pi,13);
y13 = linspace(-2*pi, 2*pi, 13);
[X13, Y13] = meshgrid(x13, y13);
sampled13 = interp2(X, Y, original, X13, Y13, 'nearest');

%% ---------
%Interpolation auf 500x500
interp19 = interp2(X19, Y19, sampled19, X, Y, 'linear');
interp13 = interp2(X13, Y13, sampled13, X, Y, 'linear');



%% ----------
% Antialiasing via Mittelung
%Bedeutet dass man bevor man sampelt den ganzen spaß mittelt, also
%parktisch ein Tiefpass anwendet der die hohen Frequenzen unterdrückt

k = 25;  % Größe des Mittelungsfilters (ungerade Zahl!)
% Box-Filter
kernel = ones(k) / k^2;

smoothed = conv2(original, kernel, 'same');
sampled19_AA = interp2(X, Y, smoothed, X19, Y19, 'nearest');
interp19_AA  = interp2(X19, Y19, sampled19_AA, X, Y, 'linear');

% bringt irgentwie nicht viel

%% ----------
%Antialiasing via Subsampling
%Bedeutet dass man einfach bewusstvdie maximale Frequenz beschränkt
%Für 19 ist niquist 9.5 und wwir brauchen frequenz unterhalb dieser

f_sub = 5;
original_sub = cos(f_sub * R);
sampled19_sub = interp2(X, Y, original_sub, X19, Y19, 'nearest');
interp19_sub  = interp2(X19, Y19, sampled19_sub, X, Y, 'linear');

%% ----------
figure

subplot(3,3,1)
imagesc(original)
axis image off
title('Original')

subplot(3,3,2)
imagesc(sampled19)
axis image off
title('19×19 gesampelt')

subplot(3,3,3)
imagesc(interp19)
axis image off
title('19×19 interpoliert')

subplot(3,3,5)
imagesc(sampled13)
axis image off
title('13×13 gesampelt')

subplot(3,3,6)
imagesc(interp13)
axis image off
title('13×13 interpoliert')

subplot(3,3,4)
imagesc(interp19_AA)
axis image off
title('19x19 mit Antialiasing')

subplot(3,3,7)
imagesc(smoothed)
axis image off
title('gemittelt, also Tiefpass')
colormap gray

subplot(3,3,8)
imagesc(interp19_sub)
axis image off
title('19×19 mit Subsampling')
