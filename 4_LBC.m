clc;
clear all;
close all;
pkg load communications;

n=input("Enter code bits")
k=input("Enter msg bits")
p = input("Enter Parity matrix")

I = eye(k);
G = [I p];

m = dec2bin(0:1:2^k-1);

C = m*G;

for i = 1:2^k
  for j = 1:n
   C(i,j) = mod(C(i,j),2);
  endfor
endfor
disp("Generator Matrix")
disp(G)
disp("Codeword Matrix")
disp(C)

weight = sum(C');
disp("Hamming weight")
disp(weight')
weight(1,1) = weight(1,2);
d = min(weight);
disp("Minimum Hamming distance")
disp(d)

td = d-1;
tc = td/2;
disp("No. of Detected Errors")
disp(td)
disp("No. of Corrected Errors")
disp(tc)

H =[p' eye(n-k)];
y = input("Enter Received Codeword")
h = H';
S = y * H';
disp("Syndrome");
for i =1:n-k
  S(1,i) = mod(S(1,i),2);
endfor
disp(S);
E = eye([n,n])
if S==[0 0 0]
  disp("Valid Codeword")
else
  for i = 1:n
    if(h(i,:)== S)
    disp("Error is in bit no.")
    disp(i)
    error = i;
    break;
    end
  endfor
disp("Error Pattern")
disp(E(error,:));
x = mod(y + E(error,:),2);
disp("Corrected CodeWord")
disp(x);
end
