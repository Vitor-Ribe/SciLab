function x = raiz_babilonica(a, chute_inicial, E)
    x = chute_inicial;
    max_iter = 100;  
    iter = 0;

    while iter < max_iter
        x_novo = 0.5 * (x + a / x);
        if abs(x_novo - x) < E then
            break;
        end
        x = x_novo;
        iter = iter + 1;
    end
endfunction


E = 1e-6;  // Tolerância


a1 = 25;
chute_inicial_1 = 5;
resultado_1 = raiz_babilonica(a1, chute_inicial_1, E);
disp("Aproximação de sqrt(" + string(a1) + ") = " + string(resultado_1) + " (Scilab: " + string(sqrt(a1)) + ")");

a2 = 21;
chute_inicial_2 = 4.5;
resultado_2 = raiz_babilonica(a2, chute_inicial_2, E);
disp("Aproximação de sqrt(" + string(a2) + ") = " + string(resultado_2) + " (Scilab: " + string(sqrt(a2)) + ")");

a3 = 5000;
chute_inicial_3 = 70;
resultado_3 = raiz_babilonica(a3, chute_inicial_3, E);
disp("Aproximação de sqrt(" + string(a3) + ") = " + string(resultado_3) + " (Scilab: " + string(sqrt(a3)) + ")");
