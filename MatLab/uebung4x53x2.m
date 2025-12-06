%Y1 = Anzahl an mutterkernen
%Y2 = anzahl an tochternucleotide
%Tochternucleotide entstehen aus Zerfall, kommen in jedem Schritt Y1(i-1)-Y1(i) nucleotide hinzu
%in jedem Zeitschritt zerfallen aber auch wieder nucleotide nach der gleichung: Y2(i) = Y2(i-1) + dt*lambda2*Y2(i-1)
%also Y2(i) = Y2(i-1) + dt*lambda2*Y2(i-1) + Y1(i-1)-Y1(i)

clear all
n= 1000;
t0 = 0; t1 = 100;
y10 = 10000; lambda1 = -0.1;
lambda2 = -0.03;

dt = (t1-t0)/n;

T = zeros(n+1,1);
Y1 = zeros(n+1,1);
Y2 = zeros(n+1,1);

T(1) = t0;
Y1(1) = y10;
Y2(1) = 0;

for i = 2:n+1
    T(i) = T(i-1) + dt;
    Y1(i) = Y1(i-1) + dt*lambda1*Y1(i-1);
    Y2(i) = Y2(i-1) + dt*lambda2*Y2(i-1) + Y1(i-1)-Y1(i) ;
end

P1 = plot(T,y10*exp(lambda1*T));
hold on
P2 = plot(T, Y1, '-o');
hold on;
P3= plot(T, Y2, '.');
ylabel('Anzahl an Kernen');
xlabel('Zeit');
legend('10000*exp(-0.1*T)','Y1','Y2');
hold off
set(P1, 'LineWidth', 4, 'Color', [0 1 1]);
set(P2, 'LineWidth', 1, 'Color', [1 0 0]);
set(P3, 'LineWidth', 2, 'Color', [0 0 0]);

