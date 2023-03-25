import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(ChezPolApi());

class ChezPolApi extends StatefulWidget {
  @override
  _ChezPolApiState createState() => _ChezPolApiState();
}

class _ChezPolApiState extends State<ChezPolApi> {
  final String apiUrl =
      'https://crossorigin.me/https://newsletters-list.api.libe.fr/chezpol';
  final String apiKey = '604eHwRmXE4E1TY6Q9aCQ2C8eTYNgUxC8Vjy3ar8';

  List<dynamic> _articles = [];

  Future<void> fetchNewsletterData() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['newsletters'];
        setState(() {
          _articles = data;
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
        throw Exception('Failed to fetch data.');
      }
    } catch (error) {
      print('Error occurred: $error');
      throw Exception('Failed to fetch data.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNewsletterData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ChezPol API')),
        body: ListView.builder(
          itemCount: _articles.length,
          itemBuilder: (BuildContext context, int index) {
            final article = _articles[index];
            final title = article['title'] ?? '';
            final url = article['url'] ?? '';
            final imageUrl =
                article['image'] != null ? article['image']['url'] : '';

            return ListTile(
              title: Text(title),
              subtitle: Text(url),
              leading: imageUrl.isNotEmpty
                  ? Image.network(imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover)
                  : SizedBox(width: 50, height: 50),
            );
          },
        ),
      ),
    );
  }
}
