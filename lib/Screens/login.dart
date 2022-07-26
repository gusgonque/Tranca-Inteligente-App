import 'package:flutter/material.dart';
import 'package:projeto_formacao_empreendedora/Controller/user_controller.dart';
import 'package:projeto_formacao_empreendedora/Models/user.dart';
import '../main.dart';
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
  final mailController = TextEditingController();
  final passordController = TextEditingController();

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
              controller: mailController,
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
              controller: passordController,
              obscureText: true,
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
              onPressed: () async {
                int test = await authUser(User(
                    id: 0,
                    email: mailController.text,
                    password: passordController.text));
                if (test == 1) {
                  goToPage(context, const IndexScreen());
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('Usuario inválido!'),
                        );
                      },
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
