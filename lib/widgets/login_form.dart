import 'package:flutter/material.dart';
import '../utils/validator.dart';

class LoginForm extends StatefulWidget {
  final void Function(String email, String password) onLogin;

  const LoginForm({super.key, required this.onLogin});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: const Key('emailField'),
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == null || !Validator.isValidEmail(value)) {
                return 'Email tidak valid';
              }
              return null;
            },
          ),
          TextFormField(
            key: const Key('passwordField'),
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (value) =>
                value == null || value.isEmpty ? 'Password wajib diisi' : null,
          ),
          ElevatedButton(
            key: const Key('loginButton'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onLogin(
                  _emailController.text,
                  _passwordController.text,
                );
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
