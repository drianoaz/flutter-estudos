// Assim como o typescript podemos explicitamente definir os tipos para as variáveis
// Não há necessidade de declarar tipos em algumas situações, mas é uma boa prática

void main() {

  String nome = "Adriano de Azevedo";
  int idade = 23;
  double altura = 1.68;
  bool vish = true;

  vish = false;

  // Error: A value of type 'int' can't be assigned to a variable of type 'String'.
  // nome = 10;

  var tipoImplicito = 10;
  print(tipoImplicito);


  // se declararmos uma variável com um determinado tipo, ela só poderá
  // armazenar valores correspondentes a esse tipo a não ser que o tipo
  // seja dynamic o tipo dynamic equivale ao any do typescript e deve
  // ter sua utilizado evitada

  dynamic tipoDinamico = 10;
  print(tipoDinamico);
  tipoDinamico = "Adriano";
  print(tipoDinamico);

  // da pra fazer interpolação bem dahora
  print("Meu nome é $nome, eu tenho $idade, minha altura é ${1.68 * 100}cm, muita treta $vish");
}
