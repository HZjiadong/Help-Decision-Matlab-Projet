[A1, b1, lb] = AD_initialisation();
%Construction de la matrice des contraintes de famille du temps
Machine_contrainte = [8 15 10 5 0 10;
                      17 11 12 15 7 12;
                      8 1 11 3 0 25;
                      2 10 5 4 13 7;
                      15 0 20 7 10 25;
                      15 5 3 12 8 10;
                      15 13 15 18 10 7];
%Construction de la matrice des contraintes de famille du stockage
MP_contrainte = [1 2 3 1 1 2;
                 2 2 1 2 2 1;
                 1 0 3 2 2 1];

cout_machine = [2 2 3 3 2 3 3]';

cout_produit_temps = Machine_contrainte' * cout_machine / 60;

cout_matiere = [3 2 1];
    
cout_produit_mp = MP_contrainte' * cout_matiere';
    
revenu_brut = [55 37 60 45 35 30]';
    
benefice_contraint = revenu_brut - cout_produit_mp - cout_produit_temps;

f = [1 1 1 -1 -1 -1];

A = [A1; -benefice_contraint'; -f];
b = [b1; -8000; 0];

res = linprog(f',A,b,[],[],lb,[]);
val = f*res