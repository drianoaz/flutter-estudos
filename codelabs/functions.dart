void main() {

  printIntroducao();
  printIntroducao();

  calcSoma(10.0, 15.0);

  double resMult = calcMult(10.0, 15.0);
  print(resMult);

  print(calcAreaCirculo(5));
}

void printIntroducao() {
  print("Seja bem-vindo");
  print("sem tempo irmão");
}


// o tipo void pode ser omitido, mas explícito é melhor que implícito
calcSoma(double a, double b) {
  double res = a + b;
  print(res);
}

double calcMult(double a, double b) {
  double res = a * b;

  return res;
}


// arrow function ou fat arrow
double calcAreaCirculo(double raio) => 3.14 * raio * raio;
