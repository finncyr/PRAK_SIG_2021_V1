# Octave 6.2.0, Thu May 06 17:57:34 2021 GMT <unknown@DESKTOP-0RPDSAD>n = [-0.4 -0.2 0 0.2 0.4 0.6 0.8]x = [1 3 2 2 2 1 0]h = [0 1 0 -1 1 -1 0]conv(x,h)stem(ans)n2 = linspace(-0.6, 2.2, 13)stem(n2, ans)