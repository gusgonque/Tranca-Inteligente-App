import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_formacao_empreendedora/Models/device.dart';

const String baseURL = 'http://179.106.204.39:3000';

Future<Device> insertDevice(Device device) async {
  final response = await http.post(
    Uri.parse(baseURL + '/device/insert'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY1ODc1MTkzNSwiZXhwIjoxNjU5MzU2NzM1fQ.YDuh76gSUmsk_ldmwVo0SsfcU33tuzbl7edP4DNUuEc', //todo: token
    },
    body: jsonEncode(<String, dynamic>{
      'name': device.name,
      'code': device.code,
      'type': device.type,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Device.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to insert Device.');
  }
}

List<Device> parseDevice(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Device>((json) => Device.fromJson(json)).toList();
}

Future<List<Device>> fetchDevice(http.Client client) async {
  final response = await client.get(
    Uri.parse(baseURL + '/device/list'),
    headers: <String, String>{
      'authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY1ODc1MTkzNSwiZXhwIjoxNjU5MzU2NzM1fQ.YDuh76gSUmsk_ldmwVo0SsfcU33tuzbl7edP4DNUuEc', //todo: token
    },
  );

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseDevice, response.body);
}


Future<Device> updateDevice(Device device) async {
  final response = await http.put(
    Uri.parse(baseURL + '/device/update/' + device.id.toString()),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY1ODc1MTkzNSwiZXhwIjoxNjU5MzU2NzM1fQ.YDuh76gSUmsk_ldmwVo0SsfcU33tuzbl7edP4DNUuEc', //todo: token
    },
    body: jsonEncode(<String, dynamic>{
      'name': device.name,
      'code': device.code,
      'type': device.type,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Device.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to update Device.');
  }
}