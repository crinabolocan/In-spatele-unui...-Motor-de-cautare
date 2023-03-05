function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
%deschid si citesc fiecare element din fisier
f = fopen(nume, 'r');
N = fscanf(f, "%d", 1);
A = zeros(N);
for i = 1:N,
  a = fscanf(f, "%d", 1);
  b = fscanf(f, "%d", 1);
  for j = 1:b,
    var = fscanf(f, "%d", 1);
    if var!=a % verific daca pagina are link spre ea insasi ca sa ignor
      A(i, var) = 1;
    else
      b--; % decrementez ca sa tin cont daca am ignorat
    endif
    A(i,i) = b; % salvez pe diagonala principala nr de noduri pentru fiecare pagina
  endfor
endfor
for i = 1:N
  A(i,:) = A(i,:) / A(i,i); % fac normata
  A(i,i) = 0; % sterg ce am pus pe diagonala principala ca sa nu mi stric matricea
endfor

A = A';
  R = zeros(N);
  R = PR_Inv(eye(N)-d*A) * ((1-d)/N*ones(N,1)); %dupa ce am calulat inversa am aplicat formula
  PR_Inv(eye(N)-d*A);
endfunction