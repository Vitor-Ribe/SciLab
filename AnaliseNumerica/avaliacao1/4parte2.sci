function [x_max, converged] = newton_raphson_max(f, f_prime, f_double_prime, x0, tol, max_iter)
    x = x0;
    converged = 0;
    
    for k = 1:max_iter
        f_prime_val = f_prime(x);
        f_double_prime_val = f_double_prime(x);
        
        // Verifica se a derivada segunda é não-negativa
        if f_double_prime_val >= 0 then
            disp("O método encontrou um ponto de inflexão ou mínimo, não um máximo.");
            return;
        end
   
        x_new = x - f_prime_val / f_double_prime_val;
        
        // Verifica critério de convergência
        if abs(x_new - x) < tol then
            x = x_new;
            converged = 1;
            break;
        end
        
        x = x_new;
    end
    
    if converged == 0 then
        disp("O método não convergiu após o número máximo de iterações.");
    end
    
    // Verifica se x está dentro do intervalo
    if x < 2.0 | x > 2.5 then
        disp("A solução encontrada está fora do intervalo especificado.");
        converged = 0; 
    end
    
    x_max = x;
endfunction

// Definir a função e suas derivadas
function y = f(x)
    y = x * (3 - exp(x/4));
endfunction

function y = f_prime(x)
    y = 3 - exp(x/4) - (x/4) * exp(x/4);
endfunction

function y = f_double_prime(x)
    y = -(x/16) * exp(x/4) - (1/4) * exp(x/4);
endfunction

// Parâmetros
x0 = 2.0;
tol = 1e-3;
max_iter = 100;

// Chamar a função Newton-Raphson
[x_max, converged] = newton_raphson_max(f, f_prime, f_double_prime, x0, tol, max_iter);

if converged == 1 then
    disp("O máximo da função ocorre em x = " + string(x_max));
else
    disp("O método não encontrou uma solução no número máximo de iterações.");
end
