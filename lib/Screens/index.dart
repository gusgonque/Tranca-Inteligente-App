import 'package:flutter/material.dart';
import 'package:projeto_formacao_empreendedora/Screens/deviceRegistration.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Index';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const IndexColumn(),
      ),
    );
  }
}

class IndexColumn extends StatefulWidget {
  const IndexColumn({Key? key}) : super(key: key);

  @override
  IndexColumnState createState() {
    return IndexColumnState();
  }
}

class IndexColumnState extends State<IndexColumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RegistrationScreen(), // todo: tela de registro
                  ),
                );
              },
              child: const Text('Cadastrar novo dispositivo'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Theme.of(context).primaryColorDark,
              child: InkWell(
                onTap: () => const IndexScreen(), // todo: solicitar servidor
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('Tranca',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            letterSpacing: 3.0,
                          )),
                      Text('Código321',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
