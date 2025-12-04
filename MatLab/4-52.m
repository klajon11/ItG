n = 10;
X = [0:4*pi/(n):4*pi]
Y = sin(X)
Y2 = circshift(Y,-1) - Y;

v = (circshift(Y,-1) - Y) ./ (circshift(X,-1) - X)

z = (circshift(Y,-1) - circshift(Y,+1)) ./ ((circshift(X,-1) - circshift(X,+1)))

plot(X,z)