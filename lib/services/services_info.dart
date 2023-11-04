import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:cv_flutter_libe/models/commune_info.dart';

class CommuneInfoService {

  static Future<List<CommuneInfo>> fetchCommuneInfo() async {
    String jsonString = await rootBundle.loadString('lib/services/referentiel-gares-voyageurs.json');
    final jsonResponse = jsonDecode(jsonString) as List<dynamic>;
    return _communeInfoFromJson(jsonResponse);
  }

  static List<CommuneInfo> _communeInfoFromJson(List<dynamic> json) {
    var uniqueNamesSet = <String>{};
    List<CommuneInfo> communeInfos = [];

    for (var info in json) {
      String aliasLibelleNonContraint = info['commune_libellemin'] ?? '';
      String gareStation = info['alias_libelle_noncontraint'] ?? '';
      // Vérifiez si le nom de la ville est déjà dans le Set
      if (!uniqueNamesSet.contains(aliasLibelleNonContraint)) {
        // Si non, ajoutez-le au Set et à la liste
        uniqueNamesSet.add(aliasLibelleNonContraint);
        String departementNumero = info['departement_numero'] ?? '';
        String communeCode = info['commune_code'] ?? '';

        if (communeCode.length == 2) {
          communeCode = '0' + communeCode;
        }

        String codeConcatene = departementNumero + communeCode;

        communeInfos.add(CommuneInfo(
          aliasLibelleNonContraint: aliasLibelleNonContraint,
          codeConcatene: codeConcatene,
          gareStation: gareStation,
        ));
      }
    }

    return communeInfos;
  }
}