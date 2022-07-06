%n = order of tchebychev coefficients
function [g] = tcheby(n,Lar)
  g = ones(1,n+1);
  
  r = 40/(log(10));
  beta = log(coth(Lar/r));
  ga = sinh(beta/(2*n));
    

  g(1) = 2/ga * sin(pi/(2*n));
  
  for i=2:n
    num = sin((2*i-1)*pi/(2*n))*sin((2*i-3)*pi/(2*n));
    den = ga^2 + (sin((i-1)*pi/n))^2;
    g(i) = 1/g(i-1) *4* num / den;
  end
  
  if mod(n,2)==0 %donc paire
    g(n+1) = coth(beta/4)^2;
  else
    g(n+1) = 1;
  end

end
