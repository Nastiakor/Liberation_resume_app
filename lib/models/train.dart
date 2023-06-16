class Train {
  final String departureStation;
  final String arrivalStation;
  final DateTime arrivalTime;
  final DateTime departureTime;
  final double co2Emission;
  final Duration duration;

  const Train({
    required this.departureStation,
    required this.arrivalStation,
    required this.arrivalTime,
    required this.departureTime,
    required this.co2Emission,
    required this.duration,
  });

  factory Train.fromJson(Map<String, dynamic> json) {
    var journeys = json['journeys'] as List<dynamic>? ?? [];
    var firstJourney = journeys.isNotEmpty ? journeys[0] as Map<String, dynamic> : null;

    String departureStation = '';
    String arrivalStation = '';
    DateTime departureTime = DateTime.now();
    DateTime arrivalTime = DateTime.now();
    double co2Emission = 0.0;
    Duration duration = Duration.zero;

    if (firstJourney != null) {
      var sections = firstJourney['sections'] as List<dynamic>? ?? [];
      var firstSection = sections.isNotEmpty ? sections[0] as Map<String, dynamic> : null;
      var lastSection = sections.isNotEmpty ? sections.last as Map<String, dynamic> : null;

      if (firstSection != null && firstSection.containsKey('from') && firstSection['from'] is Map<String, dynamic>) {
        departureStation = (firstSection['from']['name'] ?? '') as String;
      }

      if (lastSection != null && lastSection.containsKey('to') && lastSection['to'] is Map<String, dynamic>) {
        arrivalStation = (lastSection['to']['name'] ?? '') as String;
      }

      if (firstJourney.containsKey('departure_date_time')) {
        departureTime = DateTime.parse(firstJourney['departure_date_time']);
      }

      if (firstJourney.containsKey('arrival_date_time')) {
        arrivalTime = DateTime.parse(firstJourney['arrival_date_time']);
      }

      if (firstJourney.containsKey('co2_emission') && firstJourney['co2_emission']['value'] != null) {
        co2Emission = double.tryParse(firstJourney['co2_emission']['value'].toString()) ?? 0.0;
      }

      if (firstJourney.containsKey('durations') && firstJourney['durations']['total'] != null) {
        duration = Duration(seconds: int.tryParse(firstJourney['durations']['total'].toString()) ?? 0);
      }
    }

    return Train(
      departureStation: departureStation,
      arrivalStation: arrivalStation,
      departureTime: departureTime,
      arrivalTime: arrivalTime,
      co2Emission: co2Emission,
      duration: duration,
    );
  }
}
