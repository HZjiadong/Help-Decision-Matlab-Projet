function [graph] = Electre1()

%Table6: matrice des jugements
matrice_jugement = [3 5 7 4;
                    5 4 3 3;
                    6 5 5 4;
                    5 2 6 7;
                    3 7 5 4;
                    2 5 4 3;
                    5 4 3 9;
                    2 6 2 4];
               
concord = concordanceEqPoid(matrice_jugement);
discord = discordance(matrice_jugement, 10);

c1 = 0.6;
c2 = 0.3;

nbSol = size(matrice_jugement, 1);
graph = zeros(nbSol, nbSol);

for i = 1: nbSol
    for j = 1:nbSol
        if concord(i, j) >= c1 && discord(i, j) <= c2
            graph(i, j) = 1;
        end
    end
end
end