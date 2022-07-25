import 'package:flutter/material.dart';
import 'package:projeto_formacao_empreendedora/main.dart';
import '../Screens/deviceUpdate.dart';
import 'device.dart';

class DeviceList extends StatelessWidget {
  const DeviceList({Key? key, required this.deviceList}) : super(key: key);
  final List<Device> deviceList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisExtent: 180,
      ),
      itemCount: deviceList.length,
      itemBuilder: (context, index) {
        return _FeatureItem(deviceList[index],
          onClick: () {
            _activateDevice(context, deviceList[index]);
          },

        );
      },
    );
  }
}


void _activateDevice(BuildContext context, Device device){
  //todo: ativar dispositivo
  //todo: /device/interaction/<deviceID> ou 1
}

class _FeatureItem extends StatelessWidget {
  final Device device;
  final Function onClick;

  const _FeatureItem(this.device, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          onLongPress: () => goToPage(context,
              UpdateScreen(key: key, id: device.id)),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            height: 60,
            width: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(device.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      letterSpacing: 3.0,
                    )),
                Text(device.code,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
