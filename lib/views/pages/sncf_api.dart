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
          child: Column(children: [
            SizedBox(height: 100),
            Container(
              child: Image.asset('img/entetesncf.png'),
            ),
            Expanded(
              child: FutureBuilder<List<Train>>(
                  future: futureTrains,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      print('snap ${snapshot}');
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var train = snapshot.data![index];
                            return Column(
                              children: [
                                Text(
                                  'Gare de départ: ${train.departureStation}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Jour de départ: ${train.departureDay}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                // Ajout du jour de départ
                                Text(
                                  'Heure de départ: ${train.departureTime}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                // Heure de départ en format HH:mm:ss
                                Text(
                                  'Gare d\'arrivée: ${train.arrivalStation}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Jour d\'arrivée: ${train.arrivalDay}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                // Ajout du jour d'arrivée
                                Text(
                                  'Heure d\'arrivée: ${train.arrivalTime}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                // Heure d'arrivée en format HH:mm:ss
                                Text(
                                  'Durée du trajet: ${train.duration}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Émissions de CO2: ${train.co2Emission.toStringAsFixed(2)} kg',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            );
                          });
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        snapshot.hasError) {
                      return Text('ERREUR : ${snapshot.error}');
                      // return const CircularProgressIndicator();
                    } else {
                      // Pendant ce temps, le hamster tourne dans la roue.
                      return CircularProgressIndicator();
                    }
                  }),
            ),
          ]),
        ),
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 1),
      ),
    );
  }
}
