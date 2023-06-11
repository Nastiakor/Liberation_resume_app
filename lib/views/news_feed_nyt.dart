import 'dart:convert';
import 'package:cv_flutter_libe/app_bottom_bar/app_bar_nyt.dart';
import 'package:cv_flutter_libe/views/tokens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:cv_flutter_libe/app_bottom_bar/bottom_navigation_bar.dart';
import 'package:cv_flutter_libe/app_bottom_bar/bottom_bar_article.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

const titleColor = Color(0XFFE60004);

void main() => runApp(const NYTAPI());

class NYTAPI extends StatefulWidget {
  const NYTAPI({Key? key}) : super(key: key);

  @override
  NYTAPIState createState() => NYTAPIState();
}

class NYTAPIState extends State<NYTAPI> {
  final String apiKey = tokenNYT;
  final String apiUrl =
      "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json";

  List<dynamic> _articles = [];

  Future<void> _fetchArticles() async {
    var response = await http.get(
      Uri.parse(apiUrl + "?api-key=" + apiKey),
    );
    if (response.statusCode == 200) {
      setState(() {
        _articles = json.decode(response.body)["results"];
        // sort the articles by date of update
        _articles.sort((a, b) {
          DateTime aUpdated = DateTime.parse(a['updated']);
          DateTime bUpdated = DateTime.parse(b['updated']);
          return bUpdated.compareTo(aUpdated); // sort in descending order
        });
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
        appBar: AppBarNYT(),
        body: _articles.isNotEmpty
            ? ListView.builder(
                itemCount: _articles.length,
                itemBuilder: (BuildContext context, int index) {
                  // get the updated date and time of the article
                  DateTime updatedDateTime =
                      DateTime.parse(_articles[index]['updated']);
                  DateTime now = DateTime.now();
                  String updated = (updatedDateTime.year == now.year &&
                          updatedDateTime.month == now.month &&
                          updatedDateTime.day == now.day)
                      ? DateFormat('HH:mm').format(updatedDateTime)
                      : DateFormat('dd MMMM').format(updatedDateTime);

                  // build the article item using the sorted data
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
                          SizedBox(
                            width: 50,
                            child: Column(
                              children: [
                                Text(
                                  updated,
                                  style: const TextStyle(
                                    fontSize: 14, // l'heure
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 5),
                                const SizedBox(
                                  height: 40,
                                  child: VerticalDivider(
                                    thickness: 2,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_articles[index]['title'],
                                    style: GoogleFonts.encodeSansCondensed(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 20,
                                            letterSpacing: 0.5))),
                                const SizedBox(height: 5),
                                Text(
                                  _articles[index]['nytdsection'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                      fontSize: 13),
                                ),
                                const SizedBox(height: 10),
                                const Divider(
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
            : const Center(child: CircularProgressIndicator()),
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 2),
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
      imageUrl = article['media'][0]['media-metadata'][2]['url'];
    }

    return Scaffold(
      appBar: AppBarNYT(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(article['section'] ?? '',
                  style: GoogleFonts.encodeSansCondensed(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: titleColor,
                          fontSize: 20,
                          letterSpacing: 0.6))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(article['title'] ?? '',
                  style: GoogleFonts.encodeSansCondensed(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: 0.5))),
            ),
            const SizedBox(height: 16),
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
              child: Text(article['abstract'] ?? '',
                  style: GoogleFonts.tinos(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: 0.6))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article['body'] ?? '',
                style: const TextStyle(
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
            TextButton(
              onPressed: () {
                _launchURL();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Read the full article on New York Times',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBarArticle(),
    );
  }

  _launchURL() async {
    String url = article['url'];
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
