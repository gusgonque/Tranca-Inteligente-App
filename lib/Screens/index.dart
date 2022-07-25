import 'package:flutter/material.dart';
import 'package:projeto_formacao_empreendedora/Controller/deviceController.dart';
import 'package:projeto_formacao_empreendedora/Models/deviceList.dart';
import 'package:projeto_formacao_empreendedora/Screens/deviceRegistration.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_formacao_empreendedora/Screens/deviceUpdate.dart';
import '../Models/device.dart';
import '../main.dart';

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
        body: const IndexColumn(),
      ),
    );
  }
}

class IndexColumn extends StatelessWidget {
  const IndexColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
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
                goToPage(
                    context,
                    UpdateScreen(
                      key: key,
                    ));
              },
              child: const Text('Alterar dispositivo'),
            ),
          ),
          Scaffold(
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
          ),
        ],
      ),
    );
  }
}
