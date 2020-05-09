
class Animal {

  String nome;
  double peso;

  Animal(this.nome, this.peso);

  void comer() {
    print("$nome comeu!");
  }

  void fazerSom() {
    print("$nome faz algum som!");
  }

}

class Cachorro extends Animal {

  int fofura;

  Cachorro(String nome, double peso, this.fofura) : super(nome, peso);

  @override
  void fazerSom() {
    print("$nome fez auau");
  }

  void brincar() {
    fofura += 10;
    print("Fofura do $nome aumentou para $fofura!!");
  }

  // toda classe do dart extende a classe object e conseguimos reescrever o metodo
  // to string
  @override
  String toString() {
    return 'Cachorro | nome: $nome, peso: $peso, fofura: $fofura';
  }
}

class Gato extends Animal {

  String nome;
  double peso;

  Gato(this.nome, this.peso) : super(nome, peso);

  bool estaAmigavel() {
    return true;
  }

  @override
  void fazerSom() {
    print("$nome fez miau");
  }
}

void main() {

  Cachorro cachorro = Cachorro("Juju", 5.5, 10);

  cachorro.fazerSom();
  cachorro.comer();
  cachorro.brincar();
  print(cachorro);

  Gato gato = Gato("Kaká", 2);

  gato.fazerSom();
  print("Está amigável? ${gato.estaAmigavel()}");
  print(gato);

}