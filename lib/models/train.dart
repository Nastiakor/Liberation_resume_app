class Train {
  final String departureStation;
  final String arrivalStation;
  final String departureDay;
  final String arrivalDay;
  final String arrivalTime;
  final String departureTime;
  final double co2Emission;
  final Duration duration;

  const Train({
    required this.departureStation,
    required this.arrivalStation,
    required this.arrivalDay,
    required this.departureDay,
    required this.arrivalTime,
    required this.departureTime,
    required this.co2Emission,
    required this.duration,
  });
}
