import 'dart:convert';
import 'package:cv_flutter_libe/Controllers/AppBarNYT.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:cv_flutter_libe/Controllers/bottomNavigationBar.dart';
import 'package:cv_flutter_libe/Controllers/BottomBarArticle.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

const titleColor = Color(0XFFE60004);

void main() => runApp(NYTAPI());

class NYTAPI extends StatefulWidget {
  const NYTAPI({Key? key}) : super(key: key);

  @override
  _NYTAPIState createState() => _NYTAPIState();
}

class _NYTAPIState extends State<NYTAPI> {
  final String apiKey = "0oUTF3Ux70XLMAopiLaFV6fzRa1XtgZ2";
  final String apiUrl = "https://api.nytimes.com/svc/mostpopular/v2/emailed/7.json";

  List<dynamic> _articles = [];

  Future<void> _fetchArticles() async {
    var response = await http.get(Uri.parse(apiUrl + "?api-key=" + apiKey));
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
        appBar: NYTAppBar(),
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
                                Text(_articles[index]['title'],
                                    style: GoogleFonts.encodeSansCondensed(
                                        textStyle: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            color: Colors.black,
                                            fontSize: 20,
                                            letterSpacing: 0.5))),
                                SizedBox(height: 5),
                                Text(
                                  _articles[index]['nytdsection'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45,
                                      fontSize: 13),
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
      appBar: NYTAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(article['section'] ?? '',
                  style: GoogleFonts.encodeSansCondensed(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: titleColor,
                          fontSize: 20,
                          letterSpacing: 0.6))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(article['title'] ?? '',
                  style: GoogleFonts.encodeSansCondensed(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          fontSize: 20,
                          letterSpacing: 0.5))),
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
              child: Text(article['abstract'] ?? '',
                  style: GoogleFonts.tinos(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: 0.6))),
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
            TextButton(
              onPressed: () async {
                String articleUrl = article['url'];
                await FlutterWebBrowser.openWebPage(
                  url: articleUrl,
                  customTabsOptions: CustomTabsOptions(
                    colorScheme: CustomTabsColorScheme.dark,
                    toolbarColor: Theme.of(context).primaryColor,
                    secondaryToolbarColor: Theme.of(context).accentColor,
                    navigationBarColor: Theme.of(context).backgroundColor,
                    addDefaultShareMenuItem: true,
                    instantAppsEnabled: true,
                    showTitle: true,
                    urlBarHidingEnabled: true,
                  ),
                  safariVCOptions: SafariViewControllerOptions(
                    barCollapsingEnabled: true,
                    preferredBarTintColor: Theme.of(context).primaryColor,
                    preferredControlTintColor: Theme.of(context).accentColor,
                    dismissButtonStyle:
                        SafariViewControllerDismissButtonStyle.close,
                    modalPresentationCapturesStatusBarAppearance: true,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
      bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 2),
    );
  }
}