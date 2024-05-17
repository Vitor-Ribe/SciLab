n1 = input("Digite o primeiro numero: ");
n2 = input("Digite o segundo numero: ");

menor = min(n1,n2);

if(menor == n1)then
    printf("%.2f, %.2f", n1, n2);
end
if(menor == n2)then
    printf("%.2f, %.2f", n2, n1);
end
