import 'package:cv_flutter_libe/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/style.dart';
import 'package:cv_flutter_libe/functions.dart';
import 'package:cv_flutter_libe/homearticles.dart';

class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var width = size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          MainArticle(title: "Wanted"),
    ],
      ),
    );
  }
}