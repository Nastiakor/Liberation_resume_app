import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cv_flutter_libe/models/commune_info.dart';
import 'package:flutter/services.dart';

class CommuneInfoService {

  static Future<List<CommuneInfo>> fetchCommuneInfo() async {
    String jsonString = await rootBundle.loadString('lib/services/referentiel-gares-voyageurs.json');
    final jsonResponse = jsonDecode(jsonString) as List<dynamic>;
    return _communeInfoFromJson(jsonResponse);
  }

  static List<CommuneInfo> _communeInfoFromJson(List<dynamic> json) {
    List<CommuneInfo> communeInfos = [];

    for (var info in json) {
      String aliasLibelleNonContraint = info['alias_libelle_noncontraint'] ?? '';
      String departementNumero = info['departement_numero'] ?? '';
      String communeCode = info['commune_code'] ?? '';

      // Ajouter un "0" si communeCode a seulement 2 caractères
      if (communeCode.length == 2) {
        communeCode = '0' + communeCode;
      }

      // Concaténer departementNumero et communeCode
      String codeConcatene = departementNumero + communeCode;

      communeInfos.add(CommuneInfo(
        aliasLibelleNonContraint: aliasLibelleNonContraint,
        codeConcatene: codeConcatene,
      ));
    }

    return communeInfos;
  }
}
