function [concord] = concordanceEqPoid(mat)
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

