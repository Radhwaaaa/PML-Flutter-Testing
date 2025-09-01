import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_1/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Alur login berhasil', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Isi email dan password
    await tester.enterText(find.byKey(const Key('emailField')), 'arads@gmail.com');
    await tester.enterText(find.byKey(const Key('passwordField')), '123456789');

    // Tekan tombol login
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    // Verifikasi pindah ke HomePage
    expect(find.text('Welcome Home!'), findsOneWidget);
  });
}
