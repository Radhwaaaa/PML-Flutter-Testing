import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/widgets/login_form.dart';

void main() {
  testWidgets('LoginForm validasi email & password', (tester) async {
    String? email;
    String? password;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginForm(
            onLogin: (e, p) {
              email = e;
              password = p;
            },
          ),
        ),
      ),
    );

    // Coba input data
    await tester.enterText(find.byKey(const Key('emailField')), 'arads1@gmail.com');
    await tester.enterText(find.byKey(const Key('passwordField')), '12345678');
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pump();

    expect(email, 'arads1@gmail.com');
    expect(password, '12345678');
  });
}
