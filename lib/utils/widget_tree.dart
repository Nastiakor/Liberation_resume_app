import 'package:cv_flutter_libe/services/auth.dart';
import 'package:cv_flutter_libe/views/pages/profile_page.dart';
import 'package:cv_flutter_libe/views/pages/login_signup_page.dart';
import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/views/components/bottom_navigation_bar.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProfilePage();
        } else {
          return const LoginPage();
        }
      },
    ),
      bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 4),
    );
  }
}
