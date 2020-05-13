import 'dart:js';

// dart2js -O2 -o hello_js.js hello_js.dart
void main() {
  String name = "Naruto Uzumaki";
  context.callMethod('alert', ['E ae Dart, eu sou $name, um dia eu vou ser Hokage']);
}