// Definindo a matriz A
A = [
    4  -1  0  -1  0   0   0   0   0;
   -1   4 -1   0 -1   0   0   0   0;
    0  -1  4   0  0  -1   0   0   0;
   -1   0  0   4 -1   0  -1   0   0;
    0  -1  0  -1  4  -1   0  -1   0;
    0   0 -1   0 -1   4   0   0  -1;
    0   0  0  -1  0   0   4  -1   0;
    0   0  0   0 -1   0  -1   4  -1;
    0   0  0   0  0  -1   0  -1   4
];

// Definindo o vetor b
b = [150; 100; 150; 50; 0; 50; 50; 0; 50];

// Realizando a decomposição LU
[L, U, P] = lu(A);

// Resolvendo o sistema
y = L \ (P*b);  // Resolve Ly = Pb
T = U \ y;      // Resolve UT = y

// Exibindo o resultado
disp("As temperaturas nos nós internos são:");
disp(T);
