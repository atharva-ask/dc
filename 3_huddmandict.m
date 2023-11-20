clc
close all
clear all
pkg load statistics
n=input("Enter length");
symbols=input("Enter Symbols array")
freq=input("Enter Frequency")
prob=freq/sum(freq);

dict = huffmandict(symbols,prob);

H = 0;
for i = 1:n
  H = H + prob(i) * log2(1/prob(i));
endfor

L = 0;
for i = 1:n
  L = L + (prob(i)*length(dict{i}));
endfor

eff = H/L *100;

disp("Entropy")
disp(H)
disp("Avg length")
disp(L)
disp("Effciency")
disp(eff)
