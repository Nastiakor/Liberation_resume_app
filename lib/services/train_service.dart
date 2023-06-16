import 'dart:convert';

import 'package:cv_flutter_libe/models/train.dart';

import 'package:http/http.dart' as http;

Future<Train> fetchTrain() async {
  final response = await http.get(
    Uri.parse('https://api.sncf.com/v1/coverage/sncf/journeys?from=admin:fr:75056&to=admin:fr:13055&datetime=20230623T231823'),
      headers: {"Authorization": "0b5df37f-3ecd-45ef-8c7d-34fd1743428f"},
  );

  if (response.statusCode == 200) {
    print(response.body);
    return Train.fromJson(jsonDecode(response.body));
  } else {
    print("Code d'erreur: ${response.statusCode}");
    print("Corps de la réponse: ${response.body}");
    throw Exception('Erreur de chargement');
  }
}


// 0b5df37f-3ecd-45ef-8c7d-34fd1743428f