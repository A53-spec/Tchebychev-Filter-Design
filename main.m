clear;
clc;


fc = 7.2*10^9;%central frequency of band pass fitler
BP = 400*10^3;      %band in Hz of bp filter
n =4;          %Order of filter +1
Lar = 0.1;      %ripple
zc=50;          %characteristic impedance

g = tcheby(n,Lar)
[C_1,L_1,C_2,L_2] = bandpass(fc,BP,zc,g)
