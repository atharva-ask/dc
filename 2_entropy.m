clc;
clear all;
close all;

n = input("Enter n");
q = input("Enter Channel matrix");
px = input("Enter P(X) Matrix");

pxd = diag(px,n,n);

py = px*q;
pxy = pxd*q;

hx = 0;
for i = 1:n
  hx = hx + -(px(i) * log2(px(i)));
endfor

hy = 0;
for i = 1:n
  hy = hy + -(py(i) * log2(py(i)));
endfor

hxy = 0;
for i = 1:n
  for j = 1:n
    hxy = hxy + -(pxy(i,j) * log2(pxy(i,j)));
  endfor
endfor

hxbyy = hxy-hy;
hybyx = hxy-hx;

Ixy = hx - hxbyy;

disp("P(X)")
disp(px)
disp("P(Y)")
disp(py)
disp("P(X,Y)")
disp(pxy)
disp("H(X)")
disp(hx)
disp("H(Y)")
disp(hy)
disp("H(X,Y)")
disp(hxy)
disp("Mutual Information")
disp(Ixy)

if hxbyy == 0
  disp("Lossless")
end
if Ixy == 0
  disp("useless")
end
if hx == hy
  if hybyx == 0
    disp("Useless")
  endif
endif
