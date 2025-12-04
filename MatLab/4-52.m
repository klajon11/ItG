n = 100;
X = [0:4*pi/(n):4*pi];
Y = sin(X);

%Teil 5
v = (circshift(Y,-1) - Y) ./ (circshift(X,-1) - X);
z = (circshift(Y,-1) - circshift(Y,+1)) ./ ((circshift(X,-1) - circshift(X,+1)));
v(1,n+1) = NaN;
z(1,1) = NaN;
z(1,n+1) = NaN;
%plot(X,v)
%plot(X,z)

%Teil 1-4 (check nicht warum man das so machen sollte wenn mans einfach wie
%5 machen kann)
Plus = circshift(eye(n+1),1);                       % Matrix die aus Y_k Y_k+1 macht
Minus = circshift(eye(n+1),1,2);                    % Matrix die aus Y_k Y_k-1 macht
Delta = circshift(eye(n+1),1) + (-1 .* eye(n+1));   % Matrix die Delta = Y_k+1 - Y macht

dV = (Y * Delta) ./ (X * Delta);
dV(1,n+1) = NaN;

Zelta = (Y * Plus - Y * Minus) ./ (X * Plus - X * Minus);
Zelta(1,1) = NaN;
Zelta(1,n+1) = NaN;
%plot(X,dV)
%plot(X,Zelta)
