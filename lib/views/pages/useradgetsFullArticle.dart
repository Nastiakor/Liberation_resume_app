import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/views/pages/useradgents_feed.dart';
import 'package:flutter_html/flutter_html.dart';

class UseradgentsFullArticle extends StatelessWidget {
  final String? content;

  UseradgentsFullArticle({Key? key, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Html(
            data: content ?? '',
          ),
        ),
      ),
    );
  }
}
