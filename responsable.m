[A, b, lb] = AD_initialisation();
%multicritère的所有代码都要放进来


% pour maximiser tous les produit, matrice de coifficient des six produits sont tous egaux aux 1
%pour utiliser linprog, il faut passer Max au Min 
%donc il faut traduire la matrice f vers un minimum avec tous egaux aux -1

%responsable Atelier，追求产量最大化，也就是每个产品的系数都是最大的
f = [1 1 1 1 1 1]';

res = linprog(-f,A,b,[],[],lb,[]);
val = f'*res
