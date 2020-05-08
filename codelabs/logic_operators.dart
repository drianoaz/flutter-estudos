void main() {

  // Comparadores
  // --------------------
  // >  maior
  // >= maior ou igual
  // <  menor
  // <= menor ou igual
  // == igual
  // != diferente

  double num1 = 15.0;
  bool testComp = (10 != num1);
  print("COMP: $testComp");

  // Operador OR
  // true  || true  -> true
  // true  || false -> true
  // false || true  -> true
  // false || false -> true

  bool testOr1 = (false || true);
  print("OR: $testOr1");

  bool testOr2 = (false || false);
  print("OR: $testOr2");

  // Operador AND
  // true  && true  -> true
  // true  && false -> false
  // false && true  -> false
  // false && false -> false

  bool testAnd1 = (true || true);
  print("AND: $testAnd1");

  bool testAnd2 = (false || true);
  print("AND: $testAnd2");

  // Operador NOT
  // !true  -> false
  // !false -> true

  print(!true);
}