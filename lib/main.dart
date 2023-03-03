import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    print("size: $size");
    print("platform: $platform");
    double width = MediaQuery.of(context).size.width;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: SizedBox(
          child: Image.asset('img/1200px-Libération.svg.png',
              height: 100, width: 100),
        ),
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: size.width,
                  child: Image.asset(
                      'img/85808-cherche-ancien-affiche-vectoriel.jpg',
                      width: size.width,
                      fit: BoxFit.cover),
                ),
              ],
            ),
            Row(
              children:[
                Container(
                width: size.width,
                  child: Row(
                  children:[
                  redTitle("WANTED"),
                    blackTitle("Deux développeurs repentis en cavale en recherche d'une alternance")
            ],
            ),
              ),
                ],
            ),
          ],
        ),
      ),
    );
  }
}

Text redTitle(String title) {
  return Text(
    "$title",
    style:
        TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
  );
}

Text blackTitle(String title) {
  return Text(
    "$title",
    style: TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
  );
}

Text paragraph(String paragraph) {
  return Text(
    "$paragraph",
    style: TextStyle(color: Colors.black45, fontSize: 10),
  );
}

DateTime momentInTime = DateTime(2022, 1, 1, 0, 0, 0); // set your moment in time
DateTime currentTime = DateTime.now();

Duration timeElapsed = currentTime.difference(momentInTime);


