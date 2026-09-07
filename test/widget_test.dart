import 'package:flutter_test/flutter_test.dart';
import 'package:taxiseguro_app/main.dart';
import 'package:taxiseguro_app/screens/home_screen.dart';

void main() {
  testWidgets('Smoke test - home screen loads', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TaxiSeguroApp());

    // Verify that the HomeScreen widget is present.
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
