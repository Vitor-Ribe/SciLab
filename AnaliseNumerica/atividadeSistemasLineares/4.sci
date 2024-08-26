// Dados da tabela
A = [
    1, 2, 4, 2, 4, 5;
    2, 0, 1, 2, 2, 2;
    4, 2, 3, 1, 5, 3;
    3, 1, 2, 3, 2, 2;
    1, 2, 0, 3, 1, 2;
    1, 0, 1, 0, 4, 3;
    5, 3, 2, 2, 3, 2
];

D = [60, 40, 40, 50, 70, 60];

// Número de produtos e matérias-primas
[num_produtos, num_materias] = size(A);

// Função objetivo: maximizar a soma das unidades produzidas
f = -ones(num_produtos, 1);

// Restrições de desigualdade
// A * x <= D
A_ineq = A;
b_ineq = D;

// Restrições de não-negatividade
lb = zeros(num_produtos, 1);

// Restrições de inteiros
intcon = 1:num_produtos;

// Resolver o problema
[x, fval, exitflag, output] = intlinprog(f, intcon, A_ineq, b_ineq, [], [], lb, []);

// Exibir resultados
disp("Unidades produzidas de cada produto:");
disp(x);

// Calcular a perda de cada tipo de matéria-prima
materias_usadas = A * x;
perda = D' - materias_usadas;
disp("Perda de cada tipo de matéria-prima:");
disp(perda);
