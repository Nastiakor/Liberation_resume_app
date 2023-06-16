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
  late Future<Train> futureTrain;

  @override
  void initState() {
    super.initState();
    futureTrain = fetchTrain();
    // precacheImage(AssetImage('img/entetesncf.png'), context);
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
                      Text(
                        snapshot.data!.departureStation,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        snapshot.data!.arrivalStation,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '${snapshot.data!.departureTime}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '${snapshot.data!.arrivalTime}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '${snapshot.data!.duration}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '${snapshot.data!.co2Emission}',
                        style: TextStyle(color: Colors.white),
                      ),
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
