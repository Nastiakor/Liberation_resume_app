import 'dart:convert';
import 'package:cv_flutter_libe/Controllers/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:cv_flutter_libe/Controllers/bottomNavigationBar.dart';
import 'package:cv_flutter_libe/Controllers/BottomBarArticle.dart';

void main() => runApp(NYTAPI());

class NYTAPI extends StatefulWidget {
  const NYTAPI({Key? key}) : super(key: key);

  @override
  _NYTAPIState createState() => _NYTAPIState();
}

class _NYTAPIState extends State<NYTAPI> {
  final String apiKey = "0oUTF3Ux70XLMAopiLaFV6fzRa1XtgZ2";
  final String apiUrl =
      "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json";

  List<dynamic> _articles = [];

  Future<void> _fetchArticles() async {
    var response = await http.get(Uri.parse(apiUrl + "?api-key=" + apiKey));
    if (response.statusCode == 200) {
      setState(() {
        _articles = json.decode(response.body)["results"];
      });
    } else {
      throw Exception('Failed to fetch articles');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYT Most Popular',
      home: Scaffold(
        appBar: MyAppBarFeed(),
        body: _articles.isNotEmpty
            ? ListView.builder(
          itemCount: _articles.length,
          itemBuilder: (BuildContext context, int index) {
            var updated =
            _articles[index]['updated'].toString().substring(11, 16);
            return InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ArticlePage(article: _articles[index]),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      child: Column(
                        children: [
                          Text(
                            updated,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 40,
                            child: VerticalDivider(
                              thickness: 2,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _articles[index]['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            _articles[index]['nytdsection'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Divider(
                            color: Colors.grey,
                            thickness: 0.5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )
            : Center(child: CircularProgressIndicator()),
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 1),
      ),
    );
  }
}
class ArticlePage extends StatelessWidget {
  final Map<String, dynamic> article;

  const ArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imageUrl;
    if (article['media'] != null && article['media'].isNotEmpty) {
      imageUrl = article['media'][0]['media-metadata'][0]['url'];
    }
    return Scaffold(
      appBar: MyAppBarFeed(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                article['title'] ?? '',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                article['updated_date'] ?? '',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                article['abstract'] ?? '',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article['body'] ?? '',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
              if (imageUrl != null)
              Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarObject(),
    );
  }
}