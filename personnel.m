[A1, b1, lb] = AD_initialisation();

%Table 1: temps unitaire d'usinage d'un produit sur une machine (en mn!!)
Machine_contrainte = [8 15 10 5 0 10;
                      17 11 12 15 7 12;
                      8 1 11 3 0 25;
                      2 10 5 4 13 7;
                      15 0 20 7 10 25;
                      15 5 3 12 8 10;
                      15 13 15 18 10 7];

%Table2: quantit¨¦ de mati¨¨re premi¨¨res par produit
MP_contrainte = [1 2 3 1 1 2;
                 2 2 1 2 2 1;
                 1 0 3 2 2 1];
             
%Table5: co?t horaire des machines par heure
cout_machine = [2 2 3 3 2 3 3]';

%Table5': co?t horaire des machine par minutes
cout_produit_temps = Machine_contrainte' * cout_machine / 60;

%Table4: co?t d'achat des mati¨¨res premi¨¨res
cout_matiere = [3 2 1];

%Table4':co?t des mati¨¨res premi¨¨res pour chaque produire    
cout_produit_mp = MP_contrainte' * cout_matiere';

%Table4:prix de vente des produits finis   
revenu_brut = [55 37 60 45 35 30]';

%Table de b¨¦n¨¦fice pour chaque produit: 
%prix de vente des produits finis - couts des mati¨¨res premi¨¨res de chaque produit - co?ts des machines utilise¨¦s pour chqaue produit    
benefice_contraint = revenu_brut - cout_produit_mp - cout_produit_temps;

A = [A1; -benefice_contraint'];
b = [b1; -8000];


f = [32 11 32 22 15 22];


res = linprog(f',A,b,[],[],lb,[]);
val = f*res