clear all
n= 1000;
t0 = 0; t1 = 100;
y10 = 10000; lambda1 = -0.1;

dt = (t1-t0)/n;

T = zeros(n+1,1);
Y1 = zeros(n+1,1);

T(1) = t0;
Y1(1) = y10;

for i = 2:n+1
    T(i) = T(i-1) + dt;
    Y1(i) = Y1(i-1) + dt*lambda1*Y1(i-1);
end

P1 = plot(T,y10*exp(lambda1*T));
hold on
P2 = plot(T, Y1, '-o');
hold off
set(P1, 'LineWidth', 4, 'Color', [0 1 1]);
set(P2, 'LineWidth', 1, 'Color', [1 0 0]);