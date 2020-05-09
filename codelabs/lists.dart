void main () {
  List<String> nomes = ["Adriano", "Sheila", "Marcia"];

  print(nomes[0]);
  nomes.add("Xablau");
  print(nomes);

  print(nomes.length);
  nomes.removeAt(2);
  print(nomes);

  nomes.insert(1, "teste");
  print(nomes);

  print(nomes.contains("Adriano"));
}