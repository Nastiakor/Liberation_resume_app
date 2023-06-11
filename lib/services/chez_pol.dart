import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:google_fonts/google_fonts.dart';
import 'package:cv_flutter_libe/views/components/bottom_navigation_bar.dart';
import 'package:cv_flutter_libe/views/components/bottom_bar_article.dart';

class ChezPol extends StatefulWidget {
  ChezPol({Key? key}) : super(key: key);

  @override
  _ChezPolState createState() => _ChezPolState();
}

class _ChezPolState extends State<ChezPol> {
  late Future<List<Map<String, dynamic>>> _futureNewsletters;

  @override
  void initState() {
    super.initState();
    _futureNewsletters = fetchNewsletterData();
  }

  Column _buildFullWidthTile(
      Map<String, dynamic> newsletter, String deliveryDate) {
    return Column(children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WebViewPage(
                url: newsletter['url'],
              ),
            ),
          );
        },
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: [
                      TextSpan(
                        text: '${deliveryDate.toUpperCase()}',
                        style: GoogleFonts.varelaRound(
                          backgroundColor: Colors.green,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text:
                            " ${newsletter['title'].split(' ')[0].toUpperCase()}", // Premier mot du titre
                            style: GoogleFonts.varelaRound(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            text:
                            " ${newsletter['title'].split(' ').sublist(1).join(' ').toUpperCase()}", // Reste du titre
                            style: GoogleFonts.varelaRound(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  newsletter['intro'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 12),
              if (newsletter['imageUrl'] != null &&
                  newsletter['imageUrl'] != '')
                Image.network(newsletter['imageUrl'],
                    width: double.infinity, height: 200, fit: BoxFit.cover),
              SizedBox(height: 12),
              if (newsletter['summary'] != null &&
                  (newsletter['summary'] as List).isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (newsletter['summary'] as List)
                        .map<Widget>((summaryPoint) {
                      List<InlineSpan> spans = [];
                      String remainingText = summaryPoint;

                      for (var expression in highlightedExpressions) {
                        if (remainingText
                            .toUpperCase()
                            .contains(expression.toUpperCase())) {
                          List<String> splitText =
                          remainingText.split(expression.toUpperCase());
                          spans.add(
                            TextSpan(
                              text: splitText[0],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          );
                          spans.add(
                            TextSpan(
                              text: expression,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                backgroundColor: Colors.red,
                              ),
                            ),
                          );
                          if (splitText.length > 1) {
                            remainingText = splitText[1];
                          }
                        }
                      }

                      if (spans.isEmpty) {
                        spans.add(
                          TextSpan(
                            text: remainingText,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        );
                      } else if (remainingText.isNotEmpty) {
                        spans.add(
                          TextSpan(
                            text: remainingText,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: RichText(
                          text: TextSpan(
                            text: '',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            children: spans,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              SizedBox(height: 10),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    ]);
  }

  Widget _buildHalfWidthTile(
      Map<String, dynamic> newsletter, String deliveryDate) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Image.network(newsletter['imageUrl'],
                  width: double.infinity, height: 200, fit: BoxFit.cover),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: [
                          TextSpan(
                            text: '${deliveryDate.toUpperCase()}',
                            style: GoogleFonts.varelaRound(
                              backgroundColor: Colors.green,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text:
                                " ${newsletter['title'].split(' ')[0].toUpperCase()}", // Premier mot du titre
                                style: GoogleFonts.varelaRound(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              TextSpan(
                                text:
                                " ${newsletter['title'].split(' ').sublist(1).join(' ').toUpperCase()}", // Reste du titre
                                style: GoogleFonts.varelaRound(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 5, right: 8),
                    child: Text("${newsletter['intro']}"),
                  ),
                ],
              ),
            ),
          ],
        ),
        newsletter['summary'] != null &&
            (newsletter['summary'] as List).isNotEmpty
            ? Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16, left:15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (newsletter['summary'] as List)
                .map<Widget>((summaryPoint) {
              List<InlineSpan> spans = [];
              String remainingText = summaryPoint;

              for (var expression in highlightedExpressions) {
                if (remainingText
                    .toUpperCase()
                    .contains(expression.toUpperCase())) {
                  List<String> splitText =
                  remainingText.split(expression.toUpperCase());
                  spans.add(
                    TextSpan(
                      text: splitText[0],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  );
                  spans.add(
                    TextSpan(
                      text: expression,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.green,
                      ),
                    ),
                  );
                  if (splitText.length > 1) {
                    remainingText = splitText[1];
                  }
                }
              }

              if (spans.isEmpty) {
                spans.add(
                  TextSpan(
                    text: remainingText,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                );
              } else if (remainingText.isNotEmpty) {
                spans.add(
                  TextSpan(
                    text: remainingText,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                );
              }
              return RichText(
                text: TextSpan(
                  children: spans,
                ),
              );
            }).toList(),
          ),
        )
            : Container(),
      ],
    );
  }

  Future<List<Map<String, dynamic>>> fetchNewsletterData() async {
    final url = Uri.parse('https://newsletters-list.api.libe.fr/chezpol');
    final apiKey = "604eHwRmXE4E1TY6Q9aCQ2C8eTYNgUxC8Vjy3ar8";

    try {
      final response = await http.get(url, headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Headers": "*",
        "x-api-key": apiKey,
      });

      if (response.statusCode == 200) {
        List<dynamic> jsonDataResponse =
        jsonDecode(utf8.decode(response.bodyBytes));

        for (var newsletter in jsonDataResponse) {
          final Uri newsletterUrl = Uri.parse(newsletter['url']);

          try {
            final response = await http.get(newsletterUrl);

            if (response.statusCode == 200) {
              final dom.Document document = parser.parse(response.body);
              final List<dom.Element> imgTags =
              document.getElementsByTagName('img');
              final dom.Element? introElement = document
                  .querySelector('p[data-testid="ica9aRUf7iwNPk5keB2IX"]');
              final List<dom.Element> summaryElements = document
                  .querySelectorAll('p[data-testid="kY02irDd1x-AOZrBtHztM"]');

              if (imgTags.length > 1) {
                newsletter['imageUrl'] = imgTags[1].attributes['src'] ?? '';
              } else {
                newsletter['imageUrl'] = '';
              }

              if (introElement != null) {
                newsletter['intro'] = introElement.text;
              } else {
                newsletter['intro'] = '';
              }

              if (summaryElements.isNotEmpty) {
                newsletter['summary'] =
                    summaryElements.map((element) => element.text).toList();
              } else {
                newsletter['summary'] = [];
              }
            } else {
              print(
                  "Failed to load newsletter content at ${newsletter['url']}");
            }
          } catch (error) {
            print(
                "Failed to load newsletter content at ${newsletter['url']}: $error");
          }
        }

        return jsonDataResponse.cast<Map<String, dynamic>>();
      } else {
        print('API call failed with status code: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error during API call: $error');
      return [];
    }
  }

  String formatDeliveryDate(String dateString) {
    final DateTime dateTime = DateTime.parse(dateString);
    final String day = dateTime.day.toString();
    final String month = _getMonthName(dateTime.month);
    return '$day $month';
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'janvier';
      case 2:
        return 'février';
      case 3:
        return 'mars';
      case 4:
        return 'avril';
      case 5:
        return 'mai';
      case 6:
        return 'juin';
      case 7:
        return 'juillet';
      case 8:
        return 'août';
      case 9:
        return 'septembre';
      case 10:
        return 'octobre';
      case 11:
        return 'novembre';
      case 12:
        return 'décembre';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Image.asset(
              'img/chezpol.png',
              width: 150,
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureNewsletters,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erreur lors du chargement des données',
                style: GoogleFonts.roboto(
                    fontSize: 18, color: Colors.deepPurple[900]),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final newsletter = snapshot.data![index];
                final String deliveryDate =
                formatDeliveryDate(newsletter['deliveredAt']);
                return _buildFullWidthTile(newsletter, deliveryDate);
              },
            );
          }
        },
      ),
      bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 3),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(url)),
        ),
      ),
      bottomNavigationBar: BottomBarArticle(),
    );
  }
}

List<String> highlightedExpressions = [
  "FAIT MAISON",
  "AU COMPTOIR",
  "YOUPOL",
  "BO BO BONUS",
  "ÇA ARRIVE AUJOURD'HUI",
  "L'ADDITION",
  "LE CHIFFRE",
  "PASSION ARCHIVES",
  "VU DU PERCHOIR",
  "L'OEIL DE LIBÉ",
  "LE MOT",
  "L'OEIL DE LIBE",
  "V.O.S.T",
  "VU DE...",
  "VU DE",
];
