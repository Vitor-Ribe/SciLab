n = 12;
H = zeros(n, n);
for i = 1:n
  for j = 1:n
    H(i, j) = 1 / (i + j - 1);
  end
end

b = [3.1048747; 2.1815712; 1.7528267; 1.4860237; 1.2984136; 1.1571464;
1.0459593; 0.9556691; 0.8806136; 0.8170732; 0.7624855; 0.7150172];

function x = gaussSemPivotamento(A, b)
  n = size(A, 1);
  for k = 1:n-1
    for i = k+1:n
      factor = A(i, k) / A(k, k);
      A(i, k+1:n) = A(i, k+1:n) - factor * A(k, k+1:n);
      b(i) = b(i) - factor * b(k);
    end
  end
  x = zeros(n, 1);
  x(n) = b(n) / A(n, n);
  for i = n-1:-1:1
    x(i) = (b(i) - A(i, i+1:n) * x(i+1:n)) / A(i, i);
  end
end
x = gaussSemPivotamento(H, b);
for i = 1:n
  disp(sprintf('%.4f', x(i)));
end
