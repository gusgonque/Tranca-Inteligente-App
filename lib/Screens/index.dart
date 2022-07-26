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
    const Device deviceTeste =
        Device(id: 1, name: 'Teste', code: '123456', type: 'Tranca');
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
            InkWell(
              onTap: () => activateDevice(context, deviceTeste),
              onLongPress: () => goToPage(
                  context, UpdateScreen(key: key, device: deviceTeste)),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                height: 60,
                width: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(deviceTeste.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 3.0,
                        )),
                    Text(deviceTeste.code,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
            ),
            const IndexColumn(),
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
