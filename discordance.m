function [discord] = discordance(mat, note)
nbSol = size(mat, 1);
nbCrit = size(mat, 2);
discord = zeros(nbSol, nbSol);

for i=1:nbSol
    for j=1:nbSol
        if i ~= j
            max = 0;
            for c=1:nbCrit
                if mat(i,c) < mat(j,c) && (mat(j,c)-mat(i,c)) > max
                    max = mat(j,c) - mat(i,c);
                end
            end
            discord(i,j) = max/note;
        end
    end
end
end

