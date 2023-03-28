import 'package:cv_flutter_libe/views/newsFeedNYT.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'dart:async';

void main() => runApp(SNCFConnect());

class SNCFConnect extends StatefulWidget {
  const SNCFConnect({Key? key}) : super(key: key);

  @override
  _SNCFConnectState createState() => _SNCFConnectState();
}

class _SNCFConnectState extends State<SNCFConnect> {
  void makeApiCall() async {
    final url = Uri.parse(
        'https://api.navitia.io/v1/coverage/sandbox/stop_areas/stop_area%3ARAT%3ASA%3ABASTI/lines/line%3ARAT%3AM5/departures?count=4&depth=2&');
    final headers = {'Authorization': '3b036afe-0110-4202-b9ed-99718476c2e0'};
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      // handle success
      print(response.body);
    } else {
      // handle error
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    makeApiCall();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SNCF Connect API',
      home: Scaffold(
        appBar: AppBar(title: Text("Hello")),
        body: Center(
          child: Text('Coucou'),
        ),
      ),
    );
  }
}
