function x = solucaoTridiagonal(n, A, b)
    for i = 2:n
        fator = A(i, i-1) / A(i-1, i-1);
        A(i, i) = A(i, i) - fator * A(i-1, i);
        b(i) = b(i) - fator * b(i-1);
    end
    
    x = zeros(n, 1);
    x(n) = b(n) / A(n, n);
    for i = n-1:-1:1
        x(i) = (b(i) - A(i, i+1) * x(i+1)) / A(i, i);
    end
end

function y = solucaoTridiagonalSystem(n)
    A = diag(2*ones(n,1)) + diag(-1*ones(n-1,1), 1) + diag(-1*ones(n-1,1), -1);
    
    h = 1/(n+1);
    b = (8*h^2) * ones(n,1);
    
    y = solucaoTridiagonal(n, A, b);
end

function y_exato = solucaoExata(n)
    y_exato = zeros(n, 1);
    for k = 1:n
        y_exato(k) = 4 * ((k/(n+1)) - (k/(n+1))^2);
    end
end

// Teste com n = 10 e n = 20
for n = [10, 20]
    y = solucaoTridiagonalSystem(n);
    y_exato = exactSolution(n);
    
    disp("Resultados para n = " + string(n));
    disp("Solução numérica:");
    disp(y);
    disp("Solução exata:");
    disp(y_exato);
    disp("Diferença:");
    disp(y - y_exato);
end
