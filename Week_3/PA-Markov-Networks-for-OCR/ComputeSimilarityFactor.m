function factor = ComputeSimilarityFactor (images, K, i, j)
% This function computes the similarity factor between two character images
% in one word --- which characters is given by indices i and j (a
% description of how the factor should be computed is given below).
%
% Input:
%   images: A struct array of character images from one word. is this
%   struct array or array of structs?
%   K: The alphabet size.
%   i,j: The scope of that factor. That is, you should construct a factor
%     between characters i and j in the images array.
%
% Output:
%   factor: The similarity factor between these two characters. For any
%     assignment C_i != C_j, the factor value should be one. For any
%     assignment C_i == C_j, the factor value should be
%     ImageSimilarity(I_i, I_j) --- ie, the computed value given by
%     ImageSimilarity.m on the two images.
%
% Copyright (C) Daphne Koller, Stanford University, 2012

factor = struct('var', [], 'card', [], 'val', []);

% Your code here:
factor.card = [K, K];
factor.var = [i, j];
% if assignments of characters: C_i != C_j, val = 1, otherwise, val = sim(I_i, I_j)
factor.val = ones(K * K, 1);
assignments = IndexToAssignment(1:prod(factor.card), factor.card);
sameCharIndex = assignments(:, 1) - assignments(:, 2);
factor.val(sameCharIndex == 0) = ImageSimilarity(images(i).img, images(j).img);
end

