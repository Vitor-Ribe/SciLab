// Função para calcular o Jacobiano
function J = jacobiano(x, y)
    J = [2*x - 2, -1;
         2*x, 8*y];
endfunction

// Função para o sistema de equações
function F = sistema(x, y)
    F = [x^2 - 2*x - y + 0.5;
         x^2 + 4*y^2 - 4];
endfunction

// Função para o Método de Newton
function [x, y] = newton_sistema(x0, y0, iteracoes)
    x = x0;
    y = y0;

    for i = 1:iteracoes
        F = sistema(x, y);
        J = jacobiano(x, y);
        delta = -J \ F; 
        x = x + delta(1);
        y = y + delta(2);
        disp("Iteração " + string(i) + ": x = " + string(x) + ", y = " + string(y));
    end
endfunction

x0 = 2;
y0 = 0.25;
iteracoes = 3;

[x_final, y_final] = newton_sistema(x0, y0, iteracoes);

disp("Resultado final após " + string(iteracoes) + " iterações: x = " + string(x_final) + ", y = " + string(y_final));
