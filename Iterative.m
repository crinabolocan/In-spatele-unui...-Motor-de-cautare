function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
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

A = A'; %transpun
PR = zeros(N,1);
Z= zeros(N,1);
PR_ant = zeros(N,1);
PR(:,1) = 1/N;
while norm(PR - PR_ant) >= eps % conditie de eroare
  PR_ant = PR;
  PR = d*A*PR_ant + (1-d)/N*ones(N,1); %calculez PR 
endwhile

R = zeros(N,1);
R = PR_ant;
endfunction