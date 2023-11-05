import 'dart:convert';
import 'package:cv_flutter_libe/models/train.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TrainService {

  static Future<List<Train>> fetchTrains(String departureGareCode, String arrivalGareCode, String datetime) async {
    print("Gare de départ code ${departureGareCode}");
    print("Gare d'arrivée code ${arrivalGareCode}");
    print("Datetime ${datetime}");

    final response = await http.get(
      Uri.parse('https://api.sncf.com/v1/coverage/sncf/journeys?from=admin%3Afr%3A${departureGareCode}&to=admin%3Afr%3A${arrivalGareCode}&datetime=${datetime}&count=15'),
      headers: {"Authorization": "0b5df37f-3ecd-45ef-8c7d-34fd1743428f"},
    );

    if (response.statusCode == 200) {// Print JSON en une seule ligne
      return _trainsFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erreur de chargement');
    }
  }

  static List<Train> _trainsFromJson(Map<String, dynamic> json) {
    var journeys = json['journeys'] as List<dynamic>? ?? [];
    List<Train> trains = [];

    for (var journey in journeys) {
      String departureStation = '';
      String gareDeparture = '';
      String arrivalGare = '';
      String arrivalStation = '';
      String departureTime = '';
      String arrivalTime = '';
      String departureDay = '';
      String arrivalDay = '';
      double co2Emission = 0.0;
      Duration duration = Duration.zero;
      List<String> correspondenceCities = [];
      int transportSectionsCount = 0;
      int numberOfCorrespondences = 0;

      DateFormat dayFormat = DateFormat("EEEE dd MMMM yyyy", "fr_FR");
      DateFormat timeFormat = DateFormat("HH:mm:ss");

      var sections = journey['sections'] as List<dynamic>? ?? [];
      var firstSection = sections.isNotEmpty ? sections[0] as Map<String, dynamic> : null;
      var lastSection = sections.isNotEmpty ? sections.last as Map<String, dynamic> : null;

      if (firstSection != null && firstSection.containsKey('from') && firstSection['from'] is Map<String, dynamic>) {
        departureStation = (firstSection['from']['name'] ?? '') as String;
      }

      for (var section in sections) {
        if (section['type'] == 'public_transport' && section['from'] != null && section['from']['embedded_type'] == 'stop_point') {
          gareDeparture = (section['from']['stop_point']['name'] ?? '') as String;
          break;
        }
      }

      if (lastSection != null && lastSection.containsKey('to') && lastSection['to'] is Map<String, dynamic>) {
        arrivalStation = (lastSection['to']['name'] ?? '') as String;
      }

      if (journey.containsKey('departure_date_time')) {
        DateTime departureDateTime = DateTime.parse(journey['departure_date_time']);
        departureTime = timeFormat.format(departureDateTime);
        departureDay = dayFormat.format(departureDateTime);
      }

      if (journey.containsKey('arrival_date_time')) {
        DateTime arrivalDateTime = DateTime.parse(journey['arrival_date_time']);
        arrivalTime = timeFormat.format(arrivalDateTime);
        arrivalDay = dayFormat.format(arrivalDateTime);
      }

      if (journey.containsKey('co2_emission') && journey['co2_emission']['value'] != null) {
        co2Emission = double.tryParse(journey['co2_emission']['value'].toString()) ?? 0.0;
      }

      if (journey.containsKey('durations') && journey['durations']['total'] != null) {
        duration = Duration(seconds: int.tryParse(journey['durations']['total'].toString()) ?? 0);
      }

      for (var i = sections.length - 1; i >= 0; i--) {
        var section = sections[i];
        if (section['type'] == 'public_transport' && section['to'] != null && section['to']['embedded_type'] == 'stop_point') {
          arrivalGare = (section['to']['stop_point']['name'] ?? '') as String;
          break;
        }
      }

      //var sections = journey['sections'] as List<dynamic>? ?? [];
      for (var section in sections) {
        if (section['type'] == 'public_transport') {
          if (section['to'] != null && section['to']['embedded_type'] == 'stop_point') {
            String city = (section['to']['stop_point']['name'] ?? '') as String;
            correspondenceCities.add(city);
          }
        }
      }

          numberOfCorrespondences = correspondenceCities.length > 1 ? correspondenceCities.length - 1 : 0;
        print("Nombre de correspondances calculé : $numberOfCorrespondences");
        print(correspondenceCities);

      trains.add(Train(
        departureStation: departureStation,
        arrivalStation: arrivalStation,
        departureTime: departureTime,
        arrivalTime: arrivalTime,
        departureDay: departureDay,
        arrivalDay: arrivalDay,
        co2Emission: co2Emission,
        duration: duration,
        arrivalGare : arrivalGare,
        departureGare: gareDeparture,
        numberOfCorrespondences: numberOfCorrespondences,
        correspondenceCities: correspondenceCities,
      ));
    }
    return trains;
  }
}

// Uri.parse('https://api.sncf.com/v1/coverage/sncf/journeys?from=admin%3Afr%3A75056&to=admin%3Afr%3A18033&count=15'),
// Uri.parse('https://api.sncf.com/v1/coverage/sncf/journeys?from=admin%3Afr%3A75056&to=admin%3Afr%3A13055&datetime=20230616T143530&datetime_represents=departure&first_section_mode%5B%5D=walking&last_section_mode%5B%5D=walking&min_nb_transfers=0&direct_path=none&min_nb_journeys=5&is_journey_schedules=True&allowed_id%5B%5D=stop_point%3ASNCF%3A87686006%3ALongDistanceTrain&allowed_id%5B%5D=stop_point%3ASNCF%3A87751008%3ALongDistanceTrain&count=15,
//  Uri.parse('https://api.sncf.com/v1/coverage/sncf/journeys?from=admin%3Afr%3A75056&to=admin%3Afr%3A${gareCode}&datetime=20230616T143530&datetime_represents=departure&first_section_mode%5B%5D=walking&last_section_mode%5B%5D=walking&min_nb_transfers=0&direct_path=none&min_nb_journeys=5&is_journey_schedules=True&allowed_id%5B%5D=stop_point%3ASNCF%3A87686006%3ALongDistanceTrain&allowed_id%5B%5D=stop_point%3ASNCF%3A87751008%3ALongDistanceTrain&count=15'