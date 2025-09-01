import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/utils/validator.dart';

void main() {
  group('Email Validator', () {
    test('Valid email should return true', () {
      expect(Validator.isValidEmail('arads@gmail.com'), true);
    });

    test('Invalid email should return false', () {
      expect(Validator.isValidEmail('invalid_email'), false);
      expect(Validator.isValidEmail('arads@com'), false);
      expect(Validator.isValidEmail('arads.com'), false);
    });
  });
}
