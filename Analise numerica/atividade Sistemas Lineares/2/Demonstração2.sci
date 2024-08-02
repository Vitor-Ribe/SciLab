// Definir a matriz tridiagonal e o vetor b
A = [
2, -1, 0, 0, 0, 0;
-1, 2, -1, 0, 0, 0;
0, -1, 2, -1, 0, 0;
0, 0, -1, 2, -1, 0;
0, 0, 0, -1, 2, -1;
0, 0, 0, 0, -1, 2
];

b = [2; -1; 7; 5; 4; 3];

// Número de variáveis
n = size(A, 1);

// Aplicar eliminação gaussiana com pivotamento parcial
for k = 1:n-1
  // Encontrar o índice do pivô
  [maxVal, maxIndex] = max(abs(A(k:n, k)));
  maxIndex = maxIndex + k - 1;
  
  // Trocar linhas se necessário
  if maxIndex ~= k
  // Trocar linhas em A
  temp = A(k, :);
  A(k, :) = A(maxIndex, :);
  
  A(maxIndex, :) = temp;
  // Trocar elementos em b
  temp = b(k);
  b(k) = b(maxIndex);
  b(maxIndex) = temp;
  end

  // Aplicar eliminação
  for i = k+1:n
    factor = A(i, k) / A(k, k);
    A(i, k:n) = A(i, k:n) - factor * A(k, k:n);
    b(i) = b(i) - factor * b(k);
  end
end

// Exibir a matriz triangular superior e o vetor b
disp("Matriz triangular superior:");
disp(A);

disp("Vetor b atualizado:");
disp(b);

// Verificar se a matriz triangular superior é tridiagonal
tridiagonal = 1;
for i = 1:n
    for j = 1:n
      if abs(i - j) > 1 && A(i, j) != 0
      tridiagonal = 0;
    end
  end
end

if tridiagonal
  disp("A matriz triangular resultante é tridiagonal.");
else
  disp("A matriz triangular resultante NÃO é tridiagonal.");
end
