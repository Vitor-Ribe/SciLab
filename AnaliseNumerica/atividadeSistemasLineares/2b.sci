function x = resolverTridiagonalModificado(n, A, b)
    for k = 1:n-1
        if A(k, k) == 0 then
            error("Encontrado pivô zero.");
        end
        fator = A(k+1, k) / A(k, k);
        A(k+1, k) = 0;
        A(k+1, k+1) = A(k+1, k+1) - fator * A(k, k+1);
        b(k+1) = b(k+1) - fator * b(k);
    end

    x = zeros(n, 1);
    x(n) = b(n) / A(n, n);
    for k = n-1:-1:1
        x(k) = (b(k) - A(k, k+1) * x(k+1)) / A(k, k);
    end
end

n = 10;

A = zeros(n, n);
A(1, 1) = 4; A(1, 2) = -2;
A(2, 1) = -1; A(2, 2) = 2; A(2, 3) = -1; A(2, 7) = 1;
A(3, 2) = -1; A(3, 3) = 2; A(3, 4) = -1;
A(4, 3) = -1; A(4, 4) = 2; A(4, 5) = -1;
A(5, 4) = -1; A(5, 5) = 2; A(5, 6) = -1;
A(6, 5) = -1; A(6, 6) = 2; A(6, 7) = -1;
A(7, 6) = -1; A(7, 7) = 2; A(7, 8) = -1;
A(8, 7) = -1; A(8, 8) = 2; A(8, 9) = -1;
A(9, 8) = -1; A(9, 9) = 2; A(9, 2) = 1;
A(10, 9) = -2; A(10, 10) = 4;

b = [2; -1; 7; 5; 4; 3; 2; -4; 7; 8];

x = resolverTridiagonalModificado(n, A, b);

disp("Solução do sistema:");
disp(x);
