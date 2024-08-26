function x = no_inverso(C)
    x = 1.0; 
    tol = 1e-6;
    max_iter = 100; 
    iter = 0;

    // Loop de iteração do Método de Newton
    while iter < max_iter
        x_novo = x * (2 - C * x);
        if abs(x_novo - x) < tol then
            break;  
        end
        x = x_novo;
        iter = iter + 1;
    end
endfunction
