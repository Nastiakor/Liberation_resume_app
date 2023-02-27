import 'package:flutter/material.dart';

class Next extends StatefulWidget {
  final color;

  Next({required this.color});

  @override
  NextState createState() => NextState();
}

class NextState extends State<Next> {

  bool showApp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (showApp) ? AppBar(
        title: const Text('Nouvelle page'),
        backgroundColor: widget.color,
      ): null,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              setState(() {
                showApp = !showApp;
              });
            },
                child: Text((showApp) ? "Cacher": "Montrer")),
            ElevatedButton(onPressed: (() => Navigator.of(context).pop()), child: const Text("Retour"))
          ],

        ),
      ),
    );
  }
}