Fs = 22050; % abtastfrequenz
T = 1/Fs; % abtastabstand

% hilfsfunktionen
function reversed = reverse(a)
    len = length(a)
    for i=1:len
        reversed(i) = a(len - i + 1)
    end
end

function [a, na, ta] = mirror(arr, narr, tarr)
    a = reverse(arr);
    na = reverse(narr);
    na = na .* (-1);
    ta = reverse(tarr);
    ta = ta .* (-1);
end

% berechne y[t] = sum[m=-Inf:Inf](x[t] * h[n - m]);
function v = foldsum(t, arr, narr, oarr, onarr)
    v = 0;
    c = narr(1) - onarr(1);
    
    for i=1:length(arr)
        v = v + (arr(i) * getsignal(oarr, (i + c - t)));
    end
end

function val = getsignal(a, i)
    if (i > length(a))
        val = 0;
    elseif (i < 1)
        val = 0;
    else
        val = a(i);
    end
end

% werte vorbereitung:
x = [1  3  2  2  2  1]
h = [1  0 -1  1 -1   ]

% achsen
nx = (1:1:length(x)) - 3;
tx = nx .* 0.2;
nh = (1:1:length(h)) - 2;
th = nh .* 0.2;

% ränder
NXL = nx(1);
NHL = nh(1);
NXR = nx(length(nx));
NHR = nh(length(nh));
IX = length(x);
IH = length(h);


[hM, nhM, thM] = mirror(h, nh, th);

% faltung
for i=(NXL+NHL):(NXR+NHR)
    y(i + 4) = foldsum(i, x, nx, hM, nhM);
    ny(i + 4) = i;
end
ty = ny .* 0.2;

% plot
figure
subplot(3, 1, 1);
stem(nx, x);
xlabel("nx");
ylabel("x");
subplot(3, 1, 2);
stem(nh, h);
xlabel("nh");
ylabel("h");
subplot(3, 1, 3);
stem(ny, y);
xlabel("ny");
ylabel("y");

figure
subplot(3, 1, 1);
stem(tx, x);
xlabel("tx");
ylabel("x");
subplot(3, 1, 2);
stem(th, h);
xlabel("th");
ylabel("h");
subplot(3, 1, 3);
stem(ty, y);
xlabel("ty");
ylabel("y");



