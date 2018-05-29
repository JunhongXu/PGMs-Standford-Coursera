%ComputeMarginal Computes the marginal over a set of given variables
%   M = ComputeMarginal(V, F, E) computes the marginal over variables V
%   in the distribution induced by the set of factors F, given evidence E
%
%   M is a factor containing the marginal over variables V
%   V is a vector containing the variables in the marginal e.g. [1 2 3] for
%     X_1, X_2 and X_3.
%   F is a vector of factors (struct array) containing the factors 
%     defining the distribution
%   E is an N-by-2 matrix, each row being a variable/value pair. 
%     Variables are in the first column and values are in the second column.
%     If there is no evidence, pass in the empty matrix [] for E.


function M = ComputeMarginal(V, F, E)

% Check for empty factor list
if (numel(F) == 0)
      warning('Warning: empty factor list');
      M = struct('var', [], 'card', [], 'val', []);      
      return;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE:
% M should be a factor
% Remember to renormalize the entries of M!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M = struct('var', [], 'card', [], 'val', []); % Returns empty factor. Change this.

if (~isempty(E))
    % observe evidence
    F = ObserveEvidence(F, E);
    for i=1: length(F)
        % check whether evidence is observed in this factor
%         if (~isempty(intersect(E(:, 1), F(i).var(1))))
            % sum every n rows to get the probability
            sumNRows = F(i).card(1);
            assignments = IndexToAssignment(1: prod(F(i).card), F(i).card);
            for j= 1: length(assignments)/sumNRows
                probSum = sum(F(i).val(sumNRows*(j-1)+1: sumNRows*j));
                if (probSum~=0)
                    F(i).val(sumNRows*(j-1)+1: sumNRows*j) = double(F(i).val(sumNRows*(j-1)+1: sumNRows*j)/probSum);
                end
            end
    end
end

% compute joint distribution
Joint = ComputeJointDistribution(F);
% marginalization
% disp(Joint.var)
M = FactorMarginalization(Joint, setdiff(Joint.var, V));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
