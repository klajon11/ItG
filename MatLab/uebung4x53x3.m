%ode23();
%Solve a set of non-stiff Ordinary Differential Equations
%
%ode45();
%
%
%
clear all
t0 = 0; t1 = 100;
y10 = 10000; lambda1 = -0.1;
y20 = 0; lambda2 = -0.03;
tspan = [t0 t1];


f=@(T,y) [
  lambda1*y(1);
  lambda2*y(2) - lambda1*y(1);
];

[T, y] = ode45(f, tspan, [y10; y20]);

Y1= y(:,1);
Y2= y(:,2);


P1 = plot(T,y10*exp(lambda1*T));
hold on
P2 = plot(T,Y1,'o');
P3 = plot(T, Y2,'o');

ylabel('Anzahl an Kernen');
xlabel('Zeit');
legend('10000*exp(-0.1*T)','Y1 numerisch','Y2 numerisch');
hold off
set(P1, 'LineWidth', 4, 'Color', [0 1 1]);
set(P2, 'LineWidth', 1, 'Color', [1 0 0]);
set(P3, 'LineWidth', 2, 'Color', [1 0 1]);

