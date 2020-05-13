
# Dart

## O que é Dart? Como surgiu? Quem esta por trás dela?

Dart é uma linguagem de programação de uso geral, uma linguagem multi-paradigma, fortemente tipada,
apresentada pelo Google, em 2011, com o objetivo de substituir o JavaScript como principal 
linguagem embutida nos navegadores.

O Google chegou até a lançar uma versão experimental do Chromium chamada "Dartium" que incluia uma VM 
onde era possível executar código Dart sem haver a necessidade de compilar o código fonte para javascript.

```html
<!DOCTYPE html>
<html>
  <body>
    <script type="application/dart" src="app.dart"></script>

    <!-- Support for non-Dart browsers. -->
    <script src="packages/browser/dart.js"></script>
  </body>
</html>
```

Hoje vemos que o Google abandonou essa ideia e criou um transpilador para JavaScript. 

O Dart possui uma sintaxe com estilo baseado no C. Isso faz com que sua sintaxe seja muito similar à linguagens
como Java, C# e JavaScript.

```dart
main() {
  print('Hello World!');
}
```

O Dart é implementado em uma ampla variedade de plataformas e cada plataforma tem suas particularidades.
Há três maneiras principais de executar o código de dart:

  - Transpilador para JavaScript
  - DartVM
  - Processo de compilação AOF
  
#### Web

Se você deseja executar seu código Dart nos navegadores, primeiro você precisa converter esse código por meio do 
compilador `dart2js`.

#### DartVM

Assim como o Java possui a JVM, o Dart possui sua própria máquina virtual.
Se você deseja criar aplicativos de console ou servidor, pode usar o DartVM para executar o código Dart.

#### Processo de compilação AOF

Os aplicativos criados com o Flutter usam o processo de compilação AOT para gerar aplicativos 
nativos para Android e iOS a partir de uma única base de código.

## Conceitos importantes

```dart
// Define a function.
printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
main() {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
}
```

- Tudo o que você pode colocar em uma variável é um objeto e todo objeto é uma instância de uma classe. Números,
funções e até `null` são objetos. Todos os objetos são herdados da classe Object. (https://api.dart.dev/stable/2.8.2/dart-core/Object-class.html)

- Embora o Dart seja fortemente tipado, as anotações de tipo são opcionais, pois o Dart pode inferir tipos. 
No exemplo anterior, o número é inferido como sendo do tipo int. Quando você quiser dizer explicitamente que nenhum 
tipo é esperado, use o tipo especial `dynamic`.

- Ao contrário do Java, o Dart não possui as palavras-chave `public`, `protected` e `private`. Se um identificador 
começa com um sublinhado (_), por convenção é privado. 

Apesar de ter a biblioteca `meta` (não built-in) que ajuda a introduzir algumas notações que lembram um pouco o Java.

```dart
class Person {
  final _name;

  Person(this._name);

  String greet(String who) => 'Hello, $who. I am $_name.';
}
```


- As ferramentas Dart podem relatar dois tipos de problemas: warnings e errors. 
Os warnings são apenas indicações de que seu código pode não funcionar, mas eles não impedem a execução do seu código.
Os errors podem ser em tempo de compilação ou tempo de execução. 
Um erro em tempo de compilação impede a execução do código; um erro em tempo de execução resulta em uma exceção sendo 
gerada enquanto o código é executado (aka. em alguns casos, se não tratados, vai fazer ele fechar na cara do usuário).


## Variáveis

```dart
var name = 'Bob';
dynamic name = 'Bob';
String name = 'Bob';
```

### Valor padrão

Variáveis não inicializadas têm um valor inicial nulo. Até variáveis com tipos numéricos são inicialmente nulos.

```dart
int lineCount;
assert(lineCount == null);
```

### Diferença entre var, final e const

 - `var` pode reatribuir, mudar de valor, desde que respeite o mesmo tipo (implicita ou explicitamente) ou que seja dynamic (nessa situação não precisa
 ser do mesmo tipo).
 - `final` lembra bastante o conceito de `const` do JavaScript. Uma variável declarada com final não pode ser reatribuída.
 Mas nada impede que seu valor seja alterado dependendo do tipo de dado que armazene.
 - `const` diferente do javascript, `const` é `const`. Uma não pode reatribuir ou alterar o valor, porque são constantes
 em tempo de compilação.
 
     ```dart
     const List<String> memes = ["Oloquinho meu", "Não consegue, Moisés", "A vontade de rir é grande, mas a de chorar é maior"];
     memes.add("Xablau");
     // Unsupported operation: Cannot add to an unmodifiable list
     ``` 
 
## Tipos build-in

### Aperendendo a documentação

Dart possui suporte especial para os seguintes tipos:

- numbers
    - https://api.dart.dev/stable/2.8.2/dart-core/int-class.html
    - https://api.dart.dev/stable/2.8.2/dart-core/double-class.html
- strings
    - https://api.dart.dev/stable/2.8.2/dart-core/String-class.html
- booleans
- lists (também conhecidos como arrays)
    - 
- sets
    - Visão de conjunto da matemática
    - Pode ser útil para remover itens repetidos de uma lista
    - No projeto do utgard não encontrei nenhum uso
- maps
    - agrupador de informacoes
- runes
    - Sinceramente eu não entendi o que é isso, mas tem haver com colocar caracteres especiais no meio de textos e afins
    - São números inteiros que represeentam um Unicode
    
    - "adriano".runes.toList();
- symbols
   - Não tem uso no aplicativo
   - Opaque name used by mirrors, invocations and Function.apply.


### Exemplos de códigos interessantes

#### main

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) async {
    if (!isProduction) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };

  var deepLink = await DynamicLinks.getLink();

  await runZonedGuarded<Future<void>>(
    () async {
      runApp(MyApp(deepLink: deepLink));
    },
    exceptionHandler,
  );
}
```

#### Condições

```dart
String greetingByDate(DateTime date) {
    if (date.hour >= 1 && date.hour < 12) {
      return 'Bom dia';
    } else if (date.hour >= 12 && date.hour < 19) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
}
```

```dart
String errorHandling(message) {
  if (message.contains('query_error')) {
    return 'Houve um erro na inserção dos dados. Entre em contato com o suporte';
  } else if (message.contains('http_error')) {
    return 'Houve um erro em nossos servidores. Tente novamente mais tarde';
  } else {
    return message;
  }
}

void main() {
    DateTime date = DateTime.now();
    print(greetingByDate(date));
}
```

```dart
String hourToString(double hours) {
  int intHours = hours.floor();
  int mins = (hours * 60).floor() % 60;

  if (intHours == 1) {
    return '$intHours hora $mins min';
  }

  if (intHours == 0) {
    return '$mins min';
  }

  return '$intHours horas $mins min';
}
```

```dart
const int CLOSING_HOUR = 15;
const int OPENING_HOUR = 8;

bool isBankOpen(
  DateTime date, {
  int closingHour = CLOSING_HOUR,
  int openingHour = OPENING_HOUR,
}) {
  final int weekday = date.weekday;
  final int currentHour = date.hour;

  if (weekday == DateTime.saturday || weekday == DateTime.sunday) {
    return false;
  }

  return currentHour < closingHour && currentHour >= openingHour;
}
```

#### Parsing

```dart
int _convertVersionToInt(String value) {
  return int.parse(value.split('.').join(''));
}
```

### Operador ?

```dart
import 'package:flutter/material.dart';

Offset getPosition(GlobalKey key) {
  final RenderBox renderBox = key?.currentContext?.findRenderObject();
  return renderBox?.localToGlobal(Offset.zero);
}

Size getSize(GlobalKey key) {
  final RenderBox renderBox = key?.currentContext?.findRenderObject();
  return renderBox?.size;
}

```

#### Operador ??

```dart
import 'package:recase/recase.dart';

String normalizeEventName(String name) {
  name ??= '';
  ReCase rc = ReCase(name);

  return rc.snakeCase;
}
```

#### Refactor simples
```dart
String addZeroOnDay(int day) {
  if (day < 10) return '0$day';

  return day.toString();
}

String addZeroOnDayRefactor(int day) => day.toString().padLeft(2, '0');

void main() {
   print(addZeroOnDay(9));
   print(addZeroOnDay(10));
   print(addZeroOnDayRefactor(9));
   print(addZeroOnDayRefactor(10));
}
```


```dart
enum XerpayModel { btg, fitbank, invoice, cfs }

String translateXerpayModel(XerpayModel xerpayModel) {
  switch (xerpayModel) {
    case XerpayModel.fitbank:
      return 'fitbank';
      break;
    case XerpayModel.btg:
      return 'btg';
      break;
    case XerpayModel.invoice:
      return 'folha';
      break;
    case XerpayModel.cfs:
      return 'cfs';
      break;
    default:
      return 'unknown';
      break;
  }
}

String translateXerpayModelRefactor(XerpayModel xerpayModel) {
  Map<XerpayModel, String> model = {
    XerpayModel.fitbank: 'fitbank',
    XerpayModel.btg: 'fitbank',
    XerpayModel.invoice: 'fitbank',
    XerpayModel.cfs: 'fitbank',
  };
    
  return model[xerpayModel] ?? 'unknown';
}

void main() {
  print(translateXerpayModelRefactor(XerpayModel.btg));
  print(translateXerpayModelRefactor(null));
}
```


http://dartdoc.takyam.com/tools/dartium/
https://insights.dice.com/2019/03/27/fall-rise-dart-google-javascript-killer/
https://www.infoworld.com/article/2620303/google-launches-dart-as-a-javascript-killer.html
https://medium.com/dartlang/announcing-dart-2-80ba01f43b6
https://medium.com/flutter-comunidade-br/introdu%C3%A7%C3%A3o-a-linguagem-de-programa%C3%A7%C3%A3o-dart-b098e4e2a41e
https://www.treinaweb.com.br/blog/o-que-e-dart/
https://www.i-programmer.info/news/86-browsers/3815-dart-chromium-dartium.html
https://medium.com/@thinkdigitalsoftware/null-aware-operators-in-dart-53ffb8ae80bb