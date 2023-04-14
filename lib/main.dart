import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/Controllers/bottomNavigationBar.dart';
import 'package:cv_flutter_libe/views/homePage.dart';
import 'package:cv_flutter_libe/views/projects.dart';
import 'package:cv_flutter_libe/views/experiences.dart';
import 'package:cv_flutter_libe/views/contact.dart';
import 'package:cv_flutter_libe/views/formation.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    var contextest = context;
    print("context: $contextest");
    print("platform: $platform");
    double width = MediaQuery.of(context).size.width;

    bool _isTabSwiped = false;

    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        if (!_isTabSwiped && details.delta.dx.abs() > 10) { // swipe threshold
          _isTabSwiped = true;
          if (details.delta.dx.isNegative) {
            if (_tabController.index < _tabController.length - 1) {
              _tabController.animateTo(_tabController.index + 1);
            }
          } else {
            if (_tabController.index > 0) {
              _tabController.animateTo(_tabController.index - 1);
            }
          }
        }
      },
      onPanEnd: (DragEndDetails details) {
        _isTabSwiped = false;
      },
      child: Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Image.asset(
              'img/j&a.png',
              width: 50,
            ),
          ),
        ],
      ),
      bottom: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.black,
        isScrollable: true,
        labelStyle: TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: TextStyle(),
        tabs: [
          Tab(child: appBarMenu('Présentation')),
          Tab(child: appBarMenu('Nos projets')),
          Tab(child: appBarMenu('Nos formations')),
          Tab(child: appBarMenu('Nos expériences')),
          Tab(child: appBarMenu('Contacts')),
        ],
      ),
    ),
        body: TabBarView(
          controller: _tabController,
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
      ),
    );
  }
}

