import 'package:flutter/material.dart';
import 'package:projeto_formacao_empreendedora/Models/device.dart';
import 'package:projeto_formacao_empreendedora/Screens/index.dart';
import 'package:projeto_formacao_empreendedora/main.dart';
import '../Controller/device_controller.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key, required this.device}) : super(key: key);
  final Device device;

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Alterando dispositivo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: DeviceUpdateForm(device: device),
      ),
    );
  }
}

class DeviceUpdateForm extends StatefulWidget {
  const DeviceUpdateForm({Key? key, required this.device}) : super(key: key);
  final Device device;

  @override
  DeviceUpdateFormState createState() => DeviceUpdateFormState();
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
              validator: (deviceNameValidator) {
                if (deviceNameValidator == null || deviceNameValidator.isEmpty) {
                  nameController.text = widget.device.name;
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
              keyboardType: TextInputType.number,
              controller: codeController,
              validator: (deviceCodeValidator) {
                if (deviceCodeValidator == null || deviceCodeValidator.isEmpty) {
                  codeController.text = widget.device.code;
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
              controller: typeController,
              validator: (deviceTypeValidator) {
                if (deviceTypeValidator == null || deviceTypeValidator.isEmpty) {
                  typeController.text = widget.device.type;
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) { // todo: Validar Textos
                  updateDevice(Device(id: widget.device.id, name: nameController.text, code: codeController.text, type: typeController.text));
                  goToPage(context, const IndexScreen());// todo: Navigator.pop(context);
                }
              },
              child: const Text('Salvar'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                removeDevice(widget.device);
                goToPage(context, const IndexScreen());// todo: Navigator.pop(context);
              },
              child: const Text('Remover dispositivo'),
            ),
          ),
        ],
      ),
    );
  }
}