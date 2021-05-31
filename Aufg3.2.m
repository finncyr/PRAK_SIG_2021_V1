f0 = 330;
fs = 22050;
DUR = 3;
T = 1:(1/fs):DUR;
Tgraph = 0.01;
rad = pi()/180;

klang = T;
klang0 = (0.05 * cos(2.0 * pi() * f0 * (-14) * T + (-60 * rad)));
klang1 = (0.1  * cos(2.0 * pi() * f0 * (-12) * T + ( 60 * rad)));
klang2 = (0.05 * cos(2.0 * pi() * f0 * (-10) * T + (-60 * rad)));
klang3 = (0.05 * cos(2.0 * pi() * f0 * (-8 ) * T + (120 * rad)));
klang4 = (0.2  * cos(2.0 * pi() * f0 * (-1 ) * T + (0   * rad)));
klang5 = (0.2  * cos(2.0 * pi() * f0 * ( 1 ) * T + (0   * rad)));
klang6 = (0.05 * cos(2.0 * pi() * f0 * ( 8 ) * T + (-120* rad)));
klang7 = (0.05 * cos(2.0 * pi() * f0 * ( 10) * T + ( 50 * rad)));
klang8 = (0.1  * cos(2.0 * pi() * f0 * ( 12) * T + (-60 * rad)));
klang9 = (0.05 * cos(2.0 * pi() * f0 * ( 14) * T + ( 60 * rad)));

klang_ges = klang0 + klang1 + klang2 + klang3 + klang4 + klang5 + klang6 + klang7 + klang8 + klang9;

% plot
x = 1:1:fs * Tgraph;
y = klang_ges(1:1:fs * Tgraph);
stem(x,y);

% play
pl = audioplayer(klang_ges, fs);
play(pl);