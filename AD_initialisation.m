function [A, b, lb] = AD_initialisation()
%Construction de la matrice des contraintes de famille du temps
%Table 1: temps unitaire d'usinage d'un produit sur une machine (en mn!!)
    Machine_contrainte = [8 15 10 5 0 10;
                          17 11 12 15 7 12;
                          8 1 11 3 0 25;
                          2 10 5 4 13 7;
                          15 0 20 7 10 25;
                          15 5 3 12 8 10;
                          15 13 15 18 10 7];

%Construction de la matrice des contraintes de famille du stockage  
%Table2: quantit¨¦ de mati¨¨re premi¨¨res par produit
    MP_contrainte = [1 2 3 1 1 2;
                     2 2 1 2 2 1;
                     1 0 3 2 2 1];

%Construction of Linear inequality constraints for each machine's total working time per week;
    b_machine = [4800 4800 4800 4800 4800 4800 4800]';

%Construction of Linear inequality constraints for each stock's total capacity per week;
    b_mpContrainte = [700; 610; 815];

%Construction de la matrice A des contraintes ensembles
    A = [Machine_contrainte; MP_contrainte];
    b = [b_machine; b_mpContrainte];

%Construction of Lower Bound, witch in our case are all zeros
    lb = [0 0 0 0 0 0]';
    
end
