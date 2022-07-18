import 'package:flutter/material.dart';

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const IndexScreen(),
                    ),
                  );
                },
              child: const Text('Cadastrar novo dispositivo'),
            ),
          ),
          // GridView.builder(
          //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //     crossAxisCount: 1,
          //     mainAxisExtent: 180,
          //   ),
          //   itemCount: vehicles.length,
          //   itemBuilder: (context, index) {
          //     return _FeatureItem(vehicles[index].plate, vehicles[index].description, onClick: () {
          //       _vehicleInfo(context, vehicles[index]);
          //     },);
          //   },
          // ),
        ],
      ),
    );
  }
}

// void _DeviceInfo(BuildContext context, Vehicle vehicle) {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) => VehicleInfo(vehicle),
//     ),
//   );
// }
//
// class _FeatureItem extends StatelessWidget {
//   final String plate;
//   final String description;
//   final Function onClick;
//
//   _FeatureItem(this.plate, this.description, {required this.onClick});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Material(
//         color: Theme.of(context).primaryColor,
//         child: InkWell(
//           onTap: () => onClick(),
//           child: Container(
//             padding: EdgeInsets.all(16.0),
//             height: 60,
//             width: 110,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text('Placa:',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     )),
//                 Text(plate,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 40,
//                       letterSpacing: 3.0,
//                     )),
//                 Text('Descrição: ' + description,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 14,
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
