import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/views/components/bottom_navigation_bar.dart';
import 'package:cv_flutter_libe/models/train.dart';
import 'package:cv_flutter_libe/services/train_service.dart';

class SncfAPI extends StatefulWidget {
  const SncfAPI({super.key});

  @override
  State<SncfAPI> createState() => _SncfAPIState();
}

class _SncfAPIState extends State<SncfAPI> {
  late Future<List<Train>> futureTrains;

  @override
  void initState() {
    super.initState();
    futureTrains = TrainService.fetchTrains();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Color(0xFF0C131F),
          child: FutureBuilder<Train>(
              future: futureTrain,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  print('snap ${snapshot}');
                  return Column(
                    children: [
                      SizedBox(height: 100),
                      Container(
                        child: Image.asset('img/entetesncf.png'),
                      ),
                      SizedBox(height: 200),
                      Text('Gare de départ: ${train.departureStation}'),
                        Text('Jour de départ: ${train.departureDay}'),  // Ajout du jour de départ
                        Text('Heure de départ: ${train.departureTime}'), // Heure de départ en format HH:mm:ss
                        Text('Gare d\'arrivée: ${train.arrivalStation}'),
                        Text('Jour d\'arrivée: ${train.arrivalDay}'), // Ajout du jour d'arrivée
                        Text('Heure d\'arrivée: ${train.arrivalTime}'), // Heure d'arrivée en format HH:mm:ss
                        Text('Durée du trajet: ${train.duration}'),
                        Text('Émissions de CO2: ${train.co2Emission.toStringAsFixed(2)} kg'),
                     
                    ],
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasError) {
                  return Text('ERREUR : ${snapshot.error}');
                  // return const CircularProgressIndicator();
                } else {
                  // Pendant ce temps, le hamster tourne dans la roue.
                  return CircularProgressIndicator();
                }
              }),
        ),
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 1),
      ),
    );
  }
}

