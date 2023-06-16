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
  late Future<Train> futureTrain;
  @override

  void initState() {
    super.initState();
    futureTrain = fetchTrain();
  }

  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: SafeArea(
          child: FutureBuilder<Train>(
            future: futureTrain,
            builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                print('snap ${snapshot}');
                return Column(
                  children: [
                    Text(snapshot.data!.departureStation),
                    Text(snapshot.data!.arrivalStation),
                    Text('${snapshot.data!.departureTime}'),
                    Text('${snapshot.data!.arrivalTime}'),
                    Text('${snapshot.data!.duration}'),
                    Text('${snapshot.data!.co2Emission}'),
                    ],
                );
              }
              else if (snapshot.connectionState == ConnectionState.done && snapshot.hasError) {
              return Text('ERREUR : ${snapshot.error}');
              return const CircularProgressIndicator();
            } else {
              // Pendant ce temps, le hamster tourne dans la roue.
              return CircularProgressIndicator();
            }
            }
          ),
        ),
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 1),
    ),
    );
  }
}
