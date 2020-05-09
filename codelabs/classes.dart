import 'dart:math';

class Pessoa {

  String nome;
  int idade;
  double altura;
  int _id;
  int _teste;

//    Pessoa(String nome, int idade, double altura) {
//    this.nome = nome;
//    this.idade = idade;
//    this.altura = altura
//  }

  // argumentos posicionais são obrigatórios
  Pessoa(this.nome, this.idade, this.altura) {
    Random rand = Random();
    _id = rand.nextInt(500);
  }

  // named constructor
  Pessoa.nascer(this.nome, this.altura) {
    idade  = 0;
    print("$nome nasceu!");
    dormir();
  }

  int get id {
    return _id;
  }

  // forma abreviada para um get
  int get teste => _teste;

//  int get teste {
//    return _teste;
//  }

  set teste(int value) {
    _teste = value;
  }

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

  pessoa1.teste = 50;

  print("nome ${pessoa1.nome}");
  print("idade ${pessoa1.idade}");
  print("altura ${pessoa1.altura}");
  print("id ${pessoa1.id}");
  print("teste ${pessoa1.teste}");


  // usando um named constructor
  Pessoa pessoa2 = Pessoa.nascer("Enzo", 0.5);
  print(pessoa2.idade);

}