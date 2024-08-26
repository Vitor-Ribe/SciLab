function x = raiz_babilonica(a, chute_inicial, E)
    x = chute_inicial;
    max_iter = 100;  // Número máximo de iterações
    iter = 0;

    // Loop de iteração do método babilônico
    while iter < max_iter
        x_novo = 0.5 * (x + a / x);
        if abs(x_novo - x) < E then
            break; 
        end
        x = x_novo;
        iter = iter + 1;
    end
endfunction
