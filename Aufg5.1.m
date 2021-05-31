[z,fs]=audioread('MENU.WAV');
x = z;
nx = 1:length(x);

% hilfsfunktionen
function val = getsignal(a, i)
    if (i > length(a))
        val = 0;
    elseif (i < 1)
        val = 0;
    else
        val = a(i);
    end
end


% impulsantwort
h  = [-0.01 -0.03 -0.08 -0.08 0.04 0.23 0.33 0.23 0.04 -0.08 -0.08 -0.03 -0.01];
nh = [    0     1     2     3    4    5    6    7    8     9    10    11    12];


NXL = 0;
NHL = 0;
NXR = length(x) - 1;
NHR = 10;
NYL = NXL + NHL;
NYR = NXR + NHR;

xL = NXR - NXL + 1;
hL = NHR - NHL + 1;
yL = NYR - NYL + 1;

% faltung
for i = 1:yL
    y(i) = 0.0;
    for j = 1:hL
        y(i) = y(i) + getsignal(h, j) * getsignal(x, i - j + 1);
        ny(i) = i;
    end
end
ty = y .* (1/fs);

% gesamt signal plotten
figure
subplot(3, 1, 1);
stem(nx, x);
subplot(3, 1, 2);
stem(nh, h);
subplot(3, 1, 3);
stem(ny, y);

% 500 samples plotten

figure
subplot(3, 1, 1);
stem(nx(1:1:500), x(1:1:500));
subplot(3, 1, 2);
stem(nh, h);
subplot(3, 1, 3);
stem(ny(1:1:500), y(1:1:500));

% player raw
pl = audioplayer(x,fs);
playblocking(pl);

% player gefiltert
pl2 = audioplayer(y,fs);
playblocking(pl2);