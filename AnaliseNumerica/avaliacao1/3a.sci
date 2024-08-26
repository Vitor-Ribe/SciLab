function [x, iter] = iterative_method(A, b, x0, tol, max_iter)
    I = eye(A);  // Matriz identidade
    B = I + A;
    x = x0;
    
    for iter = 1:max_iter
        x_old = x;
        x = B * x_old - b;
        
        // Verificar critério de convergência
        if norm(x - x_old, 'inf') / norm(x, 'inf') < tol then
            break;
        end
    end
    
    if iter == max_iter then
        disp("O método não convergiu após o número máximo de iterações.");
    else
        disp("Método convergiu após " + string(iter) + " iterações.");
    end
end
