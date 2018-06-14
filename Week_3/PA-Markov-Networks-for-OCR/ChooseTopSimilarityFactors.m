function factors = ChooseTopSimilarityFactors (allFactors, F)
% This function chooses the similarity factors with the highest similarity
% out of all the possibilities.
%
% Input:
%   allFactors: An array of all the similarity factors.
%   F: The number of factors to select.
%
% Output:
%   factors: The F factors out of allFactors for which the similarity score
%     is highest.
%
% Hint: Recall that the similarity score for two images will be in every
%   factor table entry (for those two images' factor) where they are
%   assigned the same character value.
%
% Copyright (C) Daphne Koller, Stanford University, 2012

% If there are fewer than F factors total, just return all of them.
if (length(allFactors) <= F)
    factors = allFactors;
    return;
end

% Your code here:
% use bubble sort at most F times to get the largest F factors
for i=1: F + 1
    for j=1: length(allFactors)-1
         valOne = allFactors(j).val(1);
         valTwo = allFactors(j+1).val(1);
        if(valOne >= valTwo)
            % swap
            tmp = allFactors(j+1);
            allFactors(j+1) = allFactors(j);
            allFactors(j) = tmp;
        end
    end
end
factors = allFactors(length(allFactors) - F + 1:end);
factors = flip(factors);
end

