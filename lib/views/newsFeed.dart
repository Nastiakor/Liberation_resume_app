import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cv_flutter_libe/functions.dart';
import 'package:cv_flutter_libe/Controllers/bottomNavigationBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(NYTAPI());

class NYTAPI extends StatefulWidget {
  const NYTAPI({Key? key}) : super(key: key);

  @override
  _NYTAPIState createState() => _NYTAPIState();
}

class _NYTAPIState extends State<NYTAPI> {
  final String apiKey = "0oUTF3Ux70XLMAopiLaFV6fzRa1XtgZ2";
  final String apiUrl = "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json";

  late List<dynamic> _articles;

  Future<List<dynamic>> _fetchArticles() async {
    var response = await http.get(Uri.parse(apiUrl + "?api-key=" + apiKey));
    if (response.statusCode == 200) {
      return json.decode(response.body)["results"];
    } else {
      throw Exception('Failed to fetch articles');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchArticles().then((data) {
      setState(() {
        _articles = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYT Most Popular',
      home: Scaffold(
        body: _articles != null
            ? ListView.builder(
          itemCount: _articles.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(_articles[index]['title']),
              subtitle: Text(_articles[index]['abstract']),
            );
          },
        )
            : Center(child: CircularProgressIndicator()),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 1,),
      ),
    );
  }
}
