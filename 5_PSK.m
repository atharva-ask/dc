clc;
close all;
clear all;

N = 1002;
m = 3;
x = randi([0 1],1,N);

yy = []
for i = 1:3:length(x)
  if x(i)==0 && x(i+1)==0 && x(i+2)==0
    y = cosd(0)+1j*sind(0);
  endif
  if x(i)==0 && x(i+1)==0 && x(i+2)==1
    y = cosd(45)+1j*sind(45);
  endif
  if x(i)==0 && x(i+1)==1 && x(i+2)==0
    y = cosd(90)+1j*sind(90);
  endif
  if x(i)==0 && x(i+1)==1 && x(i+2)==1
    y = cosd(135)+1j*sind(135);
  endif
  if x(i)==1 && x(i+1)==0 && x(i+2)==0
    y = cosd(180)+1j*sind(180);
  endif
  if x(i)==1 && x(i+1)==0 && x(i+2)==1
    y = cosd(225)+1j*sind(225);
  endif
  if x(i)==1 && x(i+1)==1 && x(i+2)==0
    y = cosd(270)+1j*sind(270);
  endif
  if x(i)==1 && x(i+1)==1 && x(i+2)==1
    y = cosd(315)+1j*sind(315);
  endif
  yy = [yy y];
endfor

EbN0db = 20;
EbN0 = 10^(EbN0db/10);

N = 1/sqrt(2) * [randn(1,length(yy))+1j*randn(1,length(yy))];

sigma = sqrt(1/(log2(m)*EbN0));
z = yy + sigma*N;
scatterplot(z);
