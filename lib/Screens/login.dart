import 'package:flutter/material.dart';

import 'index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Login de Usuário';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const UserLoginForm(),
      ),
    );
  }
}

// Create a Form widget.
class UserLoginForm extends StatefulWidget {
  const UserLoginForm({Key? key}) : super(key: key);

  @override
  UserLoginFormState createState() {
    return UserLoginFormState();
  }
}

class UserLoginFormState extends State<UserLoginForm> {
  final _formKey = GlobalKey<FormState>();
  static const _errorMessage = 'Campo inválido.';
  final myControllerMail = TextEditingController();
  final myControllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email do Usuário',
              ),
              controller: myControllerMail,
              // The validator receives the text that the user has entered.
              validator: (userMail) {
                if (userMail == null || userMail.isEmpty) {
                  return _errorMessage;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha do Usuário',
              ),
              controller: myControllerPassword,
              obscureText: true,
              // The validator receives the text that the user has entered.
              validator: (userPassword) {
                if (userPassword == null || userPassword.isEmpty) {
                  return _errorMessage;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) { // todo: Validar Textos
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const IndexScreen(),
                    ),
                  );
                }
              },
              child: const Text('Entrar'),
            ),
          ),
        ],
      ),
    );
  }
}