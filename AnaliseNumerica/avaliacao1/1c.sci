// Definir a matriz A e o vetor b
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

b = [150; 100; 150; 50; 0; 50; 50; 0; 50];

// Inicializar o vetor de soluções
x = zeros(size(b));

// Definir parâmetros
max_iter = 100;
tol = 1e-6;

// Loop de iteração
for iter = 1:max_iter
    x_old = x;
    
    for i = 1:length(b)
        sum1 = sum(A(i, 1:i-1) .* x(1:i-1));
        sum2 = sum(A(i, i+1:$) .* x_old(i+1:$));
        
        x(i) = (b(i) - sum1 - sum2) / A(i, i);
    end

    // Verificar critério de convergência
    if norm(x - x_old, 'inf') < tol then
        disp("Método convergiu após " + string(iter) + " iterações.");
        break;
    end
end

// Verificar metodos convergiu
if iter == max_iter then
    disp("Método não convergiu após o número máximo de iterações.");
end

// Mostrar resultado
disp(x);
