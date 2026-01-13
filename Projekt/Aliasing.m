%Aliasing & Antialiasing | Radialer Cosinus

%% ----------
%Originalbild mit 500x500Pixel Abstandscosinus mit wachsender räumlicher Frequenz

N = 500;

x = linspace(-2*pi, 2*pi, N);
y = linspace(-2*pi, 2*pi, N);
[X, Y] = meshgrid(x, y);


% Abstandscosinus
RR = X.^2 + Y.^2;
original = cos(1.1 * RR);

% Plot
%figure
%imagesc(original)
%axis image off
%colormap gray
%title('Originalbild (Cosinus, hohe Auflösung)')


%% ----------
% Sampling des Originalbildes auf 19x19

x38 = linspace(-2*pi, 2*pi, 38);
y38 = linspace(-2*pi, 2*pi, 38);
[X38, Y38] = meshgrid(x38, y38);
sampled38 = interp2(X, Y, original, X38, Y38, 'nearest');


%% ---------
%Sampling des Originalbildes auf 13x13

x13 = linspace(-2*pi, 2*pi,13);
y13 = linspace(-2*pi, 2*pi, 13);
[X13, Y13] = meshgrid(x13, y13);
sampled13 = interp2(X, Y, original, X13, Y13, 'nearest');

%% ---------
%Interpolation auf 500x500
interp38 = interp2(X38, Y38, sampled38, X, Y, 'linear');
interp13 = interp2(X13, Y13, sampled13, X, Y, 'linear');



%% ----------
% Antialiasing via Mittelung
%Bedeutet dass man bevor man sampelt den ganzen spaß mittelt, also
%parktisch ein Tiefpass anwendet der die hohen Frequenzen unterdrückt

k = 21;  % Größe des Mittelungsfilters (ungerade Zahl!)
% Box-Filter
kernel = ones(k) / k^2; %berechnet arithmetischen Mittelwert in Bereich kxk 

smoothed = conv2(original, kernel, 'same'); %conv2 ist eine 2D Faltung
sampled38_AA = interp2(X, Y, smoothed, X38, Y38, 'nearest');
interp38_AA  = interp2(X38, Y38, sampled38_AA, X, Y, 'linear');

% bringt irgentwie nicht viel

%% ----------
%Antialiasing via Subsampling
%Bedeutet dass man einfach bewusstvdie maximale Frequenz beschränkt
%Für 19 ist niquist 9.5 und wwir brauchen frequenz unterhalb dieser

f_sub = 0.7; % Frequnz Verringerung
original_sub = cos(f_sub * RR);
sampled38_sub = interp2(X, Y, original_sub, X38, Y38, 'nearest');
interp38_sub  = interp2(X38, Y38, sampled38_sub, X, Y, 'linear');

%% ----------
figure

subplot(3,3,1)
imagesc(original)
axis image off


subplot(3,3,2)
imagesc(sampled38)
axis image off


subplot(3,3,3)
imagesc(interp38)
axis image off


subplot(3,3,5)
imagesc(sampled13)
axis image off


subplot(3,3,6)
imagesc(interp13)
axis image off


subplot(3,3,4)
imagesc(interp38_AA)
axis image off


subplot(3,3,7)
imagesc(smoothed)
axis image off

colormap gray

subplot(3,3,8)
imagesc(interp38_sub)
axis image off

