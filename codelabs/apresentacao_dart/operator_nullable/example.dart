import 'package:recase/recase.dart';

String normalizeEventName(String name) {
  name ??= '';
  ReCase rc = ReCase(name);

  return rc.snakeCase;
}

void main() {
  print(normalizeEventName("Event name"));
  print(normalizeEventName(null));
}