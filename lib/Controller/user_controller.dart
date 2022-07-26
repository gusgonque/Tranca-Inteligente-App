import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projeto_formacao_empreendedora/Models/device.dart';

import '../Models/user.dart';

const String baseURL = 'http://179.106.204.95:3000';

Future<int> authUser(User user) async {
  final response = await http.post(
    Uri.parse(baseURL + '/auth'),
    headers: <String, String>{
      'authorization':
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsImlhdCI6MTY1ODc1MTkzNSwiZXhwIjoxNjU5MzU2NzM1fQ.YDuh76gSUmsk_ldmwVo0SsfcU33tuzbl7edP4DNUuEc', //todo: token
      'content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'email': user.email,
      'password': user.password,
    }),
  );

  if (response.statusCode == 200) {
    return 1;
  } else {
    return 0;
  }
}