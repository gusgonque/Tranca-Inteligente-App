import 'package:flutter/material.dart';
import 'package:projeto_formacao_empreendedora/Screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blue[900],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blueAccent[700])
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

void goToPage(BuildContext context, page) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => page,
    ),
  );
}
