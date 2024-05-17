d = input("Digite o diametro: ");
p = input("Digite a profundidade(em metros): ");
a_base = %pi*((d/2)^2);
vol_m3 = a_base*p;
vol_litros = vol_m3*1000;
printf("Volume da piscina: %.2f metros cubicos ou %.2f litros", vol_m3, vol_litros);
