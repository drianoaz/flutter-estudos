void main() {

  printIntroducao();
  printIntroducao();

  calcSoma(10.0, 15.0);

  double resMult = calcMult(10.0, 15.0);
  print(resMult);

  print(calcAreaCirculo(5));

  criarBotao("Botao sair");
  print("----");
  criarBotao("Botao sair", cor: "preto");
  print("----");
  criarBotao("Botao sair", cor: "preto", largura: 15.0);
  print("----");


  botaoFunc("Adriano", adrianofunc);
  print("-----------------------------");

  // cuidado ao fazer isso, pra depurar é horrivel
  botaoFunc("Adriano", () {
    throw "anonimato";
  });

}

void printIntroducao() {
  print("Seja bem-vindo");
  print("sem tempo irmão");
}

Function adrianofunc() {
  throw "adriano func";
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


// parametros opcoioanis
void criarBotao(String texto, {String cor = "Cor padrão", double largura = 50}) {
  print(texto);
//   print(cor);
  print(largura);
}

// parametros opcoioanis
void botaoFunc(String texto, Function minhaFunction) {

  try {
    minhaFunction();
  } catch (exception, stacktrace) {
    print(exception);
    print(stacktrace);
  }

}
