import 'package:cv_flutter_libe/tabs/articles_experiences.dart';
import 'package:cv_flutter_libe/tabs/articles_formations.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/app_bottom_bar/bottom_navigation_bar.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cv_flutter_libe/tabs/articles_homePage.dart';
import 'package:cv_flutter_libe/tabs/articles_projects.dart';
import 'package:cv_flutter_libe/tabs/articles_contacts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr');
  await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyA5G-epm7dKRrs0HL9Zbp8gtts7oxZtypY",
        authDomain: "portfolio-back-6cb8a.firebaseapp.com",
        projectId: "portfolio-back-6cb8a",
        storageBucket: "portfolio-back-6cb8a.appspot.com",
        messagingSenderId: "108784622080",
        appId: "1:108784622080:web:f6c8c661a9aad9b9f496e5",),);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> with SingleTickerProviderStateMixin {
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

    bool isTabSwiped = false;

    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        if (!isTabSwiped && details.delta.dx.abs() > 10) { // swipe threshold
          isTabSwiped = true;
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
        isTabSwiped = false;
      },
      child: Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
              'img/j&a.png',
              width: 50,
            ),
        ],
      ),
      bottom: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.black,
        isScrollable: true,
        labelStyle: const TextStyle(fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(),
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
            ArticlesHomePage(),
            ArticlesProjects(),
            ArticlesFormations(),
            ArticlesExperiences(),
            ArticlesContacts(),
          ],
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 0),
      ),
    );
  }
}

