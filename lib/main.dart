import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/Controllers/bottomNavigationBar.dart';
import 'package:cv_flutter_libe/views/homePage.dart';
import 'package:cv_flutter_libe/views/projects.dart';
import 'package:cv_flutter_libe/views/divers.dart';
import 'package:cv_flutter_libe/views/experiences.dart';
import 'package:cv_flutter_libe/views/contact.dart';
import 'package:cv_flutter_libe/views/formation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Accueil',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    var contextest = context;
    print("context: $contextest");
    print("platform: $platform");
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                //  margin: const EdgeInsets.only(right: 75),
                child: Image.asset(
                  'img/1200px-Libération.svg.png',
                  width: 100,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.black,
            isScrollable: true,
            tabs: [
              Tab(
                child: Text("A la une", style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child:
                    Text("Nos projets", style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child:
                    Text("Formations", style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child: Text("Expériences pros",
                    style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child: Text("Contact",
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            homePage(),
            Projects(),
            Formations(),
            Experiences(),
            Contact(),
          ],
        ),
        resizeToAvoidBottomInset: false,
       bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 0),
       // bottomNavigationBar: MyBottomNavigationBar(
          //selectedIndex: _selectedIndex,
          //onItemTapped: _onItemTapped,
        // ),
      ),
    );
  }
}
