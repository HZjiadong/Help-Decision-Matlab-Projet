[A, b, lb] = AD_initialisation();
%responsable comptable?Atelier?
% pour maximiser tous les produit, matrice de coifficient des six produits sont tous egaux aux 1
%pour utiliser linprog, il faut passer Max au Min 
%donc il faut traduire la matrice f vers un minimum avec tous egaux aux -1
f = [1 1 1 1 1 1]';

res = linprog(-f,A,b,[],[],lb,[]);
val = f'*res
