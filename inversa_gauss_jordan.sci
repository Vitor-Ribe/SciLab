function invA = inversa_gauss_jordan(A)
    [n, m] = size(A);
    if n ~= m
        error("A matriz deve ser quadrada.");
    end

    I = eye(n, n);
    matriz_aumentada = [A I];

    for i = 1:n
        if matriz_aumentada(i, i) == 0
            for k = i+1:n
                if matriz_aumentada(k, i) ~= 0
                    matriz_aumentada([i k], :) = matriz_aumentada([k i], :);
                    break;
                end
            end
        end

        if matriz_aumentada(i, i) == 0
            error("A matriz é singular e não possui inversa.");
        end

        matriz_aumentada(i, :) = matriz_aumentada(i, :) / matriz_aumentada(i, i);

        for j = 1:n
            if i ~= j
                matriz_aumentada(j, :) = matriz_aumentada(j, :) - matriz_aumentada(j, i) * matriz_aumentada(i, :);
            end
        end
    end

    invA = matriz_aumentada(:, n+1:2*n);
end

A = [4 7; 2 6];
invA = inversa_gauss_jordan(A);
disp("Matriz original:");
disp(A);
disp("Matriz inversa:");
disp(invA);
