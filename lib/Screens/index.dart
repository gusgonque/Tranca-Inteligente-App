import 'package:flutter/material.dart';
import 'package:projeto_formacao_empreendedora/Controller/device_controller.dart';
import 'package:projeto_formacao_empreendedora/Models/device_list.dart';
import 'package:projeto_formacao_empreendedora/Screens/device_registration.dart';
import 'package:http/http.dart' as http;
import '../Models/device.dart';
import '../main.dart';
import 'device_update.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String appTitle = 'Index';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  goToPage(context, RegistrationScreen(key: key));
                },
                child: const Text('Cadastrar novo dispositivo'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  goToPage(context, IndexColumn(key: key,));
                },
                child: const Text('Lista de dispositivos'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class IndexColumn extends StatelessWidget {
  const IndexColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Dispositivos'),
      ),
      body: FutureBuilder<List<Device>>(
        future: fetchDevice(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return DeviceList(deviceList: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
