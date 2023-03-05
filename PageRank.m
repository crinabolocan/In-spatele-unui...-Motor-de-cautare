function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
  
% citirea elementelor din fisierul graf
f = fopen(nume, 'r');
N = fscanf(f, "%d", 1);
for i = 1:N,
  a = fscanf(f, "%d", 1);
  b = fscanf(f, "%d", 1);
  for j = 1:b,
    var = fscanf(f, "%d", 1);
  endfor
endfor
val1 = fscanf(nume, "%f" , 1);
val2 = fscanf(nume, "%f" , 1);
% crearea fisierului de output
filename = [nume ".out"]; %concatenare
file = fopen(filename, 'w');
fprintf(file, "%d\n", N);
fprintf(file, "\n");
%am apelat functia de iterativ pentru prima afisare de PR
PR1 = Iterative(nume, d, eps);
fprintf(file, "%.6f\n", PR1);
fprintf(file, "\n");
%am apelat functia de algrbraic pentru a doua afisare de PR
PR1 = Algebraic(nume, d);
fprintf(file, "%.6f\n", PR1);
PR1(:,2) = 1:N; % am pus o coloana noua ca sa salvez indicii paginilor(nr)
fprintf(file, "\n");
%sortez descrescator 
PR1 = sortrows(PR1, -1);
%printez folosindu-ne de functia de apartenenta pentru calcularea PR
for i = 1:N
    fprintf(file, "%d %d %.6f\n", i, PR1(i, 2), Apartenenta(PR1(i, 1), val1, val2));
endfor
fclose(nume);
fclose(filename);
endfunction