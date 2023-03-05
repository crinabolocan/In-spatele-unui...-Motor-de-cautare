Iterative
	Asa cum am scris si in comentarii, citesc din fisier,
construiesc A, matricea normata, folosindu-ma si de nr de noduri,
o transpun, initializez matricile care mi folosesc, pun conditia de eroare
si incep sa calculez PR, folosind algoritm iterativ, salvez si un anterior.
Bineinteles am inteles ce scria si am folosit wikipedia(site-ul dat in tema).
R = anteriorul pentru ca am facut o iteratie la inceput.

Algebraic
	Citesc din fisier, la fel ca la Iterative pana la calcularea PR- ului.
O fac diferit folosind functia de inversa si formula de pe wikipedia. In functia
de inversa fac Gram-Schmidt sa calculez Q, R si aplic o formula scoasa din inductie
pe foaie dupa ce am scos fiecare necunoscuta din formula R*B=Q.

PageRank 
	Am citit ce aveam nevoie din graf(N, val1, val2), am creat fiserul de output, 
am inceput sa printez cu \n N, PR de la Iterative, PR de la Algebraic.
Am introdus o noua coloana la R2 - iesirea de la Algebraic - ca sa salvez si sa se ordoneze si 
numerele paginilor. Am sortat folosind functia sortrows, descrescator, am apelat functia de 
Apartenenta ca sa calculez valoarea functiei membru in punctul x(R2(i, 2)).  Am printat si restul.

In rest am folosit informatiile din paginile date link in tema.