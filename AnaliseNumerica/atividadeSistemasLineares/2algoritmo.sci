function x = solucaoTridiagonal(n, A, b)
    for i = 2:n
        factor = A(i, i-1) / A(i-1, i-1);
        A(i, i) = A(i, i) - factor * A(i-1, i);
        b(i) = b(i) - factor * b(i-1);
    end
    
    x = zeros(n, 1);
    x(n) = b(n) / A(n, n);
    for i = n-1:-1:1
        x(i) = (b(i) - A(i, i+1) * x(i+1)) / A(i, i);
    end
end

n = 6;

A = [2, -1, 0, 0, 0, 0;
     -1, 2, -1, 0, 0, 0;
     0, -1, 2, -1, 0, 0;
     0, 0, -1, 2, -1, 0;
     0, 0, 0, -1, 2, -1;
     0, 0, 0, 0, -1, 2];

b = [2; -1; 7; 5; 4; 3];

x = solucaoTridiagonal(n, A, b);

disp(x);
