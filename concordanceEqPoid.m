%Dans un premier temps, on consid¨¨re que tous les contrainte one m¨ºme poid, c-a-d P(g1)=P(g2)=P(g3)=P(g4)=1
function [concord] = concordanceEqPoid(mat)
%mat:matrice des judgements
%dim(mat)=a*b, avec a=nb de lignes & b=nb de colonnes
%size(mat,1)=a:nombre de Solutions
%size(mat,2)=b:nombre de Critere
%size(mat,3)=1--->
%because there's no third dimension, so size returns 1 by convention

nbSol = size(mat, 1);
nbCrit = size(mat, 2);
concord = zeros(nbSol, nbSol);

for i=1:nbSol
    for j=1:nbSol
        if i ~= j
            nb = 0;
            for c=1:nbCrit
                if mat(i,c) >= mat(j,c)
                    nb=nb+1;
                end
            end
            concord(i,j) = nb/nbCrit;
        end
    end
end

end

