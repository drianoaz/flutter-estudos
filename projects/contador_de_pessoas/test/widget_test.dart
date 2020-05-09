import 'package:flutter_test/flutter_test.dart';
import 'package:contador_de_pessoas/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Home());

    // Verify that our counter starts at 0.
    expect(find.text('Pessoas: 0'), findsOneWidget);
    expect(find.text('Pode entrar'), findsOneWidget);

    // Tap the '-' icon and trigger a frame.
    await tester.tap(find.bySemanticsLabel("-1"));
    await tester.pump();

    // Verify that our counter has decremented.
    expect(find.text('Pessoas: -1'), findsOneWidget);
    expect(find.text('Mundo invertido?!'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Pessoas: 10'), findsOneWidget);
    expect(find.text('Pode entrar'), findsOneWidget);

    await tester.tap(find.bySemanticsLabel("+1"));
    await tester.pump();

    expect(find.text('Pessoas: 11'), findsOneWidget);
    expect(find.text('Lotado!'), findsOneWidget);
  });
}
