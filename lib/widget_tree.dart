import 'package:cv_flutter_libe/auth.dart';
import 'package:cv_flutter_libe/tabs/profile_page.dart';
import 'package:cv_flutter_libe/tabs/login_signup_page.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ProfilePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
