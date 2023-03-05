function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1  
  a = 1/(val2-val1);
  b = -a*val1;
  if x < val1 % intervalele de functie
    y = 0;
  elseif x > val2
    y = 1;
  else
  y = a*x + b;
  endif
endfunction