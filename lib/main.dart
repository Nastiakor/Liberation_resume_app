import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/views/components/bottom_navigation_bar.dart';
import 'package:cv_flutter_libe/utils/theme/style.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cv_flutter_libe/views/pages/articles_contacts.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:cv_flutter_libe/services/auth.dart';
import 'package:cv_flutter_libe/views/pages/recommendation.dart';
import 'package:cv_flutter_libe/views/pages/tabs.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr');

  if (kIsWeb) {
    // Configuration pour le Web
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA5G-epm7dKRrs0HL9Zbp8gtts7oxZtypY",
        authDomain: "portfolio-back-6cb8a.firebaseapp.com",
        projectId: "portfolio-back-6cb8a",
        storageBucket: "portfolio-back-6cb8a.appspot.com",
        messagingSenderId: "108784622080",
        appId: "1:108784622080:web:f6c8c661a9aad9b9f496e5",
        measurementId: "G-3JZQ027PYT",
      ),
    );
  } else {
    // Configuration pour Android et iOS
    await Firebase.initializeApp();
  }

  runApp(
    ChangeNotifierProvider<Auth>(
      create: (context) => Auth(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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

class MyStatefulWidgetState extends State<MyStatefulWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
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
        if (!isTabSwiped && details.delta.dx.abs() > 10) {
          // swipe threshold
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
          Tab(child: appBarMenu('Recommandations')),
          Tab(child: appBarMenu('Contacts')),
        ],
      ),
    ),
        body: TabBarView(
          controller: _tabController,
          children: [
            const tabsContent(tabCategory:'homePage'),
            const tabsContent(tabCategory:'Nos projets'),
            const tabsContent(tabCategory:'formations'),
            const tabsContent(tabCategory:'Nos expériences'),
            const RecommandationPage(),
            ArticlesContacts(),
          ],
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 0),
      ),
    );
  }
}
