import 'package:flutter/material.dart';
import 'package:projeto_formacao_empreendedora/Models/device.dart';
import '../Controller/deviceController.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Alterando dispositivo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const DeviceUpdateForm(),
      ),
    );
  }
}

// Create a Form widget.
class DeviceUpdateForm extends StatefulWidget {
  const DeviceUpdateForm({Key? key}) : super(key: key);

  @override
  DeviceUpdateFormState createState() {
    return DeviceUpdateFormState();
  }
}

class DeviceUpdateFormState extends State<DeviceUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
              ),
              controller: nameController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Código',
              ),
              controller: codeController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tipo',
              ),
              controller: typeController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) { // todo: Validar Textos
                  updateDevice(
                      Device(id: 0, name: nameController.text, code: codeController.text, type: typeController.text)
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