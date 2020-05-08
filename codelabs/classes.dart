class Pessoa {

  String nome;
  int idade;
  double altura;

//
//  Pessoa(String nome, int idade, double altura) {
//    this.nome = nome;
//    this.idade = idade;
//    this.altura = altura
//  }

  // argumentos posicionais são obrigatórios
  Pessoa(this.nome, this.idade, this.altura);


  void dormir() {
    print("A pessoa $nome está dormindo");
  }

  void aniversario() {
    idade++;
    print("A pessoa agora tem $idade anos");
  }

}

void main() {

  // usar new é opcional em dart
  Pessoa pessoa1 = Pessoa("Adriano", 23, 1.68);
//   pessoa1.nome = "Adriano";
//   pessoa1.idade = 23;
//   pessoa1.altura = 1.68;

  pessoa1.dormir();
  pessoa1.aniversario();

  print("nome ${pessoa1.nome}");
  print("idade ${pessoa1.idade}");
  print("altura ${pessoa1.altura}");

}