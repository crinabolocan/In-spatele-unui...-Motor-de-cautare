function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare
[N N] = size(A);   
R = zeros(N);
Q = zeros(N);
for i = 1:N
    R(i,i) = norm(A(:,i));
    Q(:,i) = A(:,i)/R(i,i);
  for j = i+1:N
    R(i,j) = Q(:,i)'*A(:,j);
    A(:,j) = A(:,j) - Q(:,i)*R(i,j);
  endfor
 endfor
 % calculez Q, R dupa formulele din laborator
 %gram-schmidt
 Q=Q';
B = zeros(N);
for i = N:-1:1
  for j= N:-1:1
    B(i,j)=(Q(i,j) - (R(i, i+1:N)*B(i+1:N, j)))/R(i,i); % am scos formula dupa fiecare termen calculat pe foaie
    % si am generalizat o
  endfor
endfor
endfunction
