function [root, iter] = find_root_pth(a, p, x0, tol, max_iter)
    x = x0;
    for iter = 1:max_iter
        x_new = (1/p) * ((p-1) * x + a / x^(p-1));
        
        // Verifica o critério de parada baseado no erro relativo
        if abs(x_new - x) / abs(x_new) < tol then
            root = x_new;
            return;
        e
        x = x_new;
    end
    
    // Se não convergir após max_iter
    disp("O método não convergiu após o número máximo de iterações.");
    root = x;
end

// Parâmetros do problema
a = 2;
p = 15;
x0 = 1.1;  // Chute inicial
tol = 1e-3;
max_iter = 100;

[root, iter] = find_root_pth(a, p, x0, tol, max_iter);

disp("Raiz 15 de 2: " + string(root));
disp("Número de iterações: " + string(iter));
