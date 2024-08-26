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
