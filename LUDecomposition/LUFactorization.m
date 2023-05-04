function [L, U, P] = LUFactorization(A)
%LUFactorization, luFactor(A): LU decomposition with pivotiing
% inputs: A = coefficient matrix
% outputs: L = lower triangular matrix, U = upper triangular matrix, P = the permutation matrix

n = size(A, 1);

if size(A, 2) ~= n
    error('matrix must be a square')
end

currentrow = 1;
currentcolumn = 1;

P = eye(n);
L = eye(n);

for b = 1:n-1
    
    %pivoting
    for i = currentrow:n
        if A(currentrow, currentcolumn) < abs(A(i, currentcolumn))
            og = A(currentrow, :);
            A(currentrow, :) = A(i, :);
            A(i, :) = og;

            %P(row, column) = row three to row one
            P([currentrow i], :) = P([i currentrow], :);
            L([b, i], 1:b-1) = L([i, b], 1:b-1);

        end
    end
    
    %gauss elimination
    for i = currentrow:n-1
        factor = A(i+1, currentcolumn)/A(currentrow, currentcolumn);
        L(i+1, currentcolumn) = factor;
        
        row1 = A(currentrow, :)*factor;
        row2 = A(i+1, :);
        
        A(i+1, :) = row2-row1;
    end

    currentrow = currentrow + 1;
    currentcolumn = currentcolumn + 1;

end

U = A;

end

