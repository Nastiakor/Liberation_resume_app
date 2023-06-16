import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/views/components/bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;
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
        body: SafeArea(
          child: FutureBuilder<List<Train>>(
            future: futureTrains,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var train = snapshot.data![index];
                    return Column(
                      children: [
                        Text('Gare de départ: ${train.departureStation}'),
                        Text('Jour de départ: ${train.departureDay}'),  // Ajout du jour de départ
                        Text('Heure de départ: ${train.departureTime}'), // Heure de départ en format HH:mm:ss
                        Text('Gare d\'arrivée: ${train.arrivalStation}'),
                        Text('Jour d\'arrivée: ${train.arrivalDay}'), // Ajout du jour d'arrivée
                        Text('Heure d\'arrivée: ${train.arrivalTime}'), // Heure d'arrivée en format HH:mm:ss
                        Text('Durée du trajet: ${train.duration}'),
                        Text('Émissions de CO2: ${train.co2Emission.toStringAsFixed(2)} kg'),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
                return Text('ERREUR : ${snapshot.error}');
              } else {
                // En attente du chargement des données
                return CircularProgressIndicator();
              }
            },
          ),
        ),
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 1),
      ),
    );
  }
}

