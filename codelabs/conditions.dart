void main() {

  double nota = 7.0;

  if(nota <= 5.0) {
    print("Exame");
  } else if(nota == 10.0) {
    print("Sucesso total");
  } else if(nota == 9.9) {
    print("Quase sucesso total");
  } else {
    print("Sucesso");
  }

  // operador ternário
  String info = nota > 5.0 ? "Aprovado" : "Exame";


  String nome = null;
  String nomeOuMensagem = nome ?? "Nome não informado";

  print(nomeOuMensagem);

}