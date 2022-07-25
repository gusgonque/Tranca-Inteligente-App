import 'package:flutter/material.dart';
import 'package:projeto_formacao_empreendedora/Models/device.dart';
import 'index.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Cadastro de dispositivo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const DeviceRegistrationForm(),
      ),
    );
  }
}

// Create a Form widget.
class DeviceRegistrationForm extends StatefulWidget {
  const DeviceRegistrationForm({Key? key}) : super(key: key);

  @override
  DeviceRegistrationFormState createState() {
    return DeviceRegistrationFormState();
  }
}

class DeviceRegistrationFormState extends State<DeviceRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  static const _errorMessage = 'Campo inválido.';
  final myControllerName = TextEditingController();
  final myControllerCode = TextEditingController();
  final myControllerType = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
              controller: myControllerName,
              // The validator receives the text that the user has entered.
              validator: (deviceName) {
                if (deviceName == null || deviceName.isEmpty) {
                  return _errorMessage;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Código',
              ),
              controller: myControllerCode,
              // The validator receives the text that the user has entered.
              validator: (deviceCode) {
                if (deviceCode == null || deviceCode.isEmpty) {
                  return _errorMessage;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tipo',
              ),
              controller: myControllerType,
              // The validator receives the text that the user has entered.
              validator: (deviceType) {
                if (deviceType == null || deviceType.isEmpty) {
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
                  // final String deviceName = myControllerName.text;
                  // final String deviceCode = myControllerCode.text;
                  // final String deviceType = myControllerType.text;
                  // const Device(name: deviceName,code: deviceCode,type: deviceType, id: 1);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const IndexScreen(),
                    ),
                  );
                }
              },
              child: const Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }
}