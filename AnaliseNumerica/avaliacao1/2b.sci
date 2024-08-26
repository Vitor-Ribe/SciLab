function [result, qtdIter] = gaussSeidel(A, B, x0, tol, qtdMaxIter)
    n = size(A, 1);
    x = x0;
    contIter = 0;
    erro = tol + 1;
    
    while erro > tol & contIter < qtdMaxIter
        xAntigo = x;
        contIter = contIter + 1;
        for i = 1:n
            somaGauss = B(i);
            for j  = 1:n
                if j <> i then
                    somaGauss = somaGauss - A(i,j) * x(j);
                end
            end
            x(i) = somaGauss/A(i,i);
        end
        erro = norm(x - xAntigo);
    end
     if erro > tol then
        error("Não convergiu, pois atingiu o número máximo de iterações");
    end
    result = x;
    qtdIter = contIter;
endfunction

A = [4 2 1;
     1 1 1;
     1 -1 1];
     
B = [9; -1; -3];

tol = 10^-5;
qtdMaxIter = 1000;
x0 = [0;0;0];

[resultado, qtdIteracoes] = gaussSeidel(A, B, x0, tol, qtdMaxIter);

disp("Os valores de A B C ");
disp(resultado);
disp("Quantidade de iterações: ");
disp(qtdIteracoes);

a = result(1);
b = result(2);
c = result(3);

function y = P(x)
    y =  a.*x.*x + b.*x + c;
endfunction

// eixo fornecidos pelo problema
eixoX = [-1, 1, 2];
eixoY = [-3, -1, 9];

X = -6: 0.1 : 4;
eixoYPoli = P(X);

plot(X, eixoYPoli, 'b-');
xlabel("Eixo X");
ylabel("Eixo Y - P(x)");
xtitle('Resultados após Gauss-Seidel');
plot(eixoX, eixoY, 'ro');

legend('Polinômio', 'Pontos fornecidos');
xgrid();
