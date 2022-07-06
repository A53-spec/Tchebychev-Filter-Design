function [C_bp_1,L_bp_1,C_bp_2,L_bp_2] = bandpass(fc,BP,zc,g)
    n = length(g);
    %pulsation calculations
    wc = 2*pi*fc;
    w1 = 2*pi*(fc-BP/2);
    w2 = 2*pi*(fc+BP/2);
    %transformation constant
    alpha = wc/(w2-w1);
    delta = 1/alpha;
    %tab of capacitor for low pass filter
    C_lp = g(1:2:n)/(wc*zc);
    %tab of inductor for low pass filter
    L_lp = (g(2:2:n-1)*zc)/(wc);

    %condo = indu para condo
    C_bp_1 = g(1:2:n)/(zc*wc*delta) * 10^12;
    L_bp_1 = delta*zc./(g(1:2:n)*wc) * 10^9;
    %indu = indu serie condo
    C_bp_2 = delta./(g(2:2:n-1)*zc*wc) * 10^12;
    L_bp_2 = g(2:2:n-1)*zc/(wc*delta) * 10^9;
  
  
end