[A1, b1, lb] = AD_initialisation();

%Table 1: temps unitaire d'usinage d'un produit sur une machine (en mn!!)
Machine_contrainte = [8 15 10 5 0 10;
                      17 11 12 15 7 12;
                      8 1 11 3 0 25;
                      2 10 5 4 13 7;
                      15 0 20 7 10 25;
                      15 5 3 12 8 10;
                      15 13 15 18 10 7];
                  
%Table2: quantité de matière premières par produit
MP_contrainte = [1 2 3 1 1 2;
                 2 2 1 2 2 1;
                 1 0 3 2 2 1];
             
%Table5: cost horaire des machines par heure
cout_machine = [2 2 3 3 2 3 3]';

%Table5': cost horaire des machine par minutes
cout_produit_temps = Machine_contrainte' * cout_machine / 60;

%Table4: cost d'achat des matières premières
cout_matiere = [3 2 1];

%Table4':cost des matières premières pour chaque produire    
cout_produit_mp = MP_contrainte' * cout_matiere';

%Table4:prix de vente des produits finis    
revenu_brut = [55 37 60 45 35 30]';

%Table de bénéfice pour chaque produit: 
%prix de vente des produits finis - couts des matières premières de chaque produit - co?ts des machines utiliseés pour chqaue produit     
benefice_contraint = revenu_brut - cout_produit_mp - cout_produit_temps;

A = [A1; -benefice_contraint'];
%8000是判断工厂正常工作状态的最小值，即“产值超过8000就视为正常状态”
b = [b1; -8000];
%这里运用的是Table2对于每个产品需要的MP的体积+产品本身的体积；
%为了简化问题，MP的体积=产品的体积
%这个f是通过加和Table2每列加和+产品本身1体积得到的    
f = [5 5 8 6 6 5]';

res = linprog(f,A,b,[],[],lb,[]);
val = f'*res