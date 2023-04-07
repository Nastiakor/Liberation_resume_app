import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cv_flutter_libe/Controllers/AppBar.dart';
import 'package:cv_flutter_libe/Controllers/bottomNavigationBar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:cv_flutter_libe/Controllers/BottomBarArticle.dart';
import 'package:html/parser.dart' show parse;
import 'package:web_browser/web_browser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_browser/web_browser.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as html_dom;

const titleColor = Color(0XFFE60004);
final unescape = HtmlUnescape();

void main() => runApp(LiberationAPI());

class LiberationAPI extends StatefulWidget {
  const LiberationAPI({Key? key}) : super(key: key);

  @override
  _LiberationAPIState createState() => _LiberationAPIState();
}

class _LiberationAPIState extends State<LiberationAPI> {
  final String apiKey = "Vahholu0aiSojahRaish6OaDeihewo";
  final String apiUrl = "https://arc.api.liberation.fr/content/v4/search/published";

  List<Map<String, dynamic>> _contentElements = [];

  Future<void> _fetchArticles() async {
    try {
      print("Fetching articles...");
      final headers = {"x-api-key": apiKey};
      final params = {
        "website": "liberation",
        "q": "slug:(Actu|Actus)",
        "size": "20",
        "from": "0",
        "sort": "display_date:desc",
        "_sourceInclude":
            "_id,canonical_url,content_restrictions.content_code,type,subtype,headlines.basic,subheadlines.basic,label.basic.text,label.live.display,label.live.text,first_publish_date,publish_date,display_date,credits.by.name,credits.affiliation.name,content_elements._id,content_elements.type,content_elements.subtype,content_elements.content,content_elements.credits.by.name,content_elements.credits.affiliation.name,content_elements.height,content_elements.width,content_elements.text,content_elements.title,content_elements.subtitle,content_elements.caption,content_elements.url,content_elements.level,content_elements.raw_oembed.type,content_elements.raw_oembed.html,content_elements.raw_oembed.height,content_elements.raw_oembed.width,content_elements.raw_oembed.url,content_elements.embed.config.displayTimestamp,content_elements.embed.config.initTimestamp,content_elements.embed.config.content,content_elements.embed.config.title,content_elements.embed.config.alternateName.label,content_elements.embed.config.alternateName.value,content_elements.embed.config.claimReviewed.label,content_elements.embed.config.claimReviewed.value,content_elements.items._id,content_elements.items.content,content_elements.items.description._id,content_elements.items.description.content,content_elements.items.description.type,content_elements.items.type,content_elements.items.url,content_elements.citation.content,content_elements.citation.type,content_elements.content_elements.content,content_elements.content_elements.type,promo_items.basic._id,promo_items.basic.url,promo_items.basic.caption,promo_items.basic.height,promo_items.basic.width,promo_items.basic.credits.by.name,promo_items.basic.credits.affiliation.name,promo_items.basic.focal_point,promo_items.basic.type,promo_items.basic.additional_properties.focal_point,promo_items.lead_art._id,promo_items.lead_art.url,promo_items.lead_art.caption,promo_items.lead_art.height,promo_items.lead_art.width,promo_items.lead_art.credits.by.name,promo_items.lead_art.credits.affiliation.name,taxonomy.primary_section.name,taxonomy.primary_section.path,taxonomy.tags.slug,taxonomy.tags.description,taxonomy.tags.text"
      };
      final queryParams = Uri(queryParameters: params).query;
      final response =
          await http.get(Uri.parse('$apiUrl?$queryParams'), headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>;
        if (data != null && data['content_elements'] != null) {
          setState(() {
            _contentElements =
                List<Map<String, dynamic>>.from(data['content_elements']);
            //print(
               // "Content elements retrieved, count: ${_contentElements.length}");
          });
        }
      } else {
        print(
            "Failed to fetch articles with status code: ${response.statusCode}");
        throw Exception('Failed to fetch articles');
      }
    } catch (error) {
      print("Error while fetching articles: $error");
      setState(() {
        _contentElements = [];
      });
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
      title: 'Liberation API',
      home: Scaffold(
        appBar: MyAppBarFeed(),
        body: _contentElements.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Row(
                children: [
                  _contentElements.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                              itemCount: _contentElements.length,
                              itemBuilder: (BuildContext context, int index) {
                                final contentElement = _contentElements[index];
                                final primarySection =
                                    contentElement['taxonomy']
                                        ['primary_section'];
                                final primarySectionName =
                                    primarySection != null
                                        ? primarySection['name']
                                        : '';
                                final headlines =
                                    contentElement['headlines'] ?? {};
                                final canonicalUrl =
                                    contentElement['canonical_url'] ?? '';
                                final displayDate =
                                    contentElement['display_date'] ?? '';
                                final dateTime = DateTime.parse(displayDate)
                                    .add(Duration(hours: 1));
                                final hourFormat = DateFormat('HH:mm');
                                final formattedHour =
                                    hourFormat.format(dateTime);
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ArticleDetailsPage(
                                          article:
                                              Article.fromJson(contentElement),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Column(
                                            children: [
                                              Text(
                                                formattedHour,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                headlines['basic'] ?? '',
                                                style: GoogleFonts
                                                    .encodeSansCondensed(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            letterSpacing:
                                                                0.5)),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                primarySectionName ?? '',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45,
                                                    fontSize: 13),
                                              ),
                                              SizedBox(height: 10),
                                              Divider(
                                                thickness: 0.5,
                                                color: Colors.grey,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: CircularProgressIndicator())
                          ],
                        )
                ],
              ),
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 1),
      ),
    );
  }
}

class Article {
  final String id;
  final String title;
  final Map<String, dynamic> headlines;
  final List<ContentElement> contentElements;
  final String primarySectionName;
  final String? imageUrl;
  Map<String, dynamic>? subheadlines;
  final String credit1;
  final credit2;
  final DateTime first_publish_date;
  final String themeTitle;
  final String? caption;
  final List<dynamic>? articlesContenus;

  Article({
    required this.id,
    required this.title,
    required this.headlines,
    required this.contentElements,
    required this.primarySectionName,
    this.imageUrl,
    this.subheadlines,
    required this.credit1,
    this.credit2,
    required this.first_publish_date,
    required this.themeTitle,
    this.caption,
    this.articlesContenus,
  });

//La méthode fromJson est une méthode statique utilisée pour convertir un objet JSON en un objet Dart.
// Cette méthode est généralement utilisée dans le cadre de la serialization/désérialization
// de données, où les données sont envoyées sous forme de chaînes JSON et
// converties en objets Dart pour être utilisées dans l'application.
// La méthode fromJson peut être implémentée dans une classe pour permettre
// à cette classe de gérer la conversion de données JSON en objet Dart

  // Une méthode factory est une méthode spéciale dans Dart qui permet de créer
  // une instance d'une classe de différentes manières. Contrairement à un constructeur normal
  // qui crée une instance en appelant le constructeur avec des arguments,
  // une méthode factory peut utiliser des algorithmes plus complexes pour
  // déterminer comment créer une instance.
  // L'utilisation d'une méthode factory peut améliorer la lisibilité du code
  // et offrir une plus grande flexibilité dans la création d'objets.
  // Par exemple, dans le cas d'une classe Article, la méthode factory fromJson
  // peut être utilisée pour créer une instance de Article
  // à partir d'un objet JSON. Cela permet de séparer la logique de création
  // de l'objet de la logique qui l'utilise.

  //Cette ligne de code filtre les éléments de données contentElementsData
  // en sélectionnant uniquement ceux dont le type est 'text'.
  // Ensuite, il utilise la méthode map pour convertir chaque élément filtré
  // en un objet ContentElement en utilisant la méthode fromJson.
  // Enfin, la méthode toList est utilisée pour convertir l'objet résultant en une liste d'objets ContentElement.
  //
  // En résumé, cette ligne de code extrait les éléments de type 'text' des données contentElementsData et les convertit en une liste d'objets ContentElement.

  factory Article.fromJson(Map<String, dynamic> json) {
    List<dynamic> contentElementsData = json['content_elements'] ?? [];
    List<ContentElement> contentElements = contentElementsData
        .where((element) => element['type'] == 'text')
        .map((element) => ContentElement.fromJson(element))
        .toList();
    // make sure contentElements is always a list even if empty
    contentElements = contentElements.isNotEmpty
        ? contentElements
        : [ContentElement(id: '', type: '', content: null)];

    final primarySection = json['taxonomy']['primary_section'];
    final primarySectionName =
        primarySection != null ? primarySection['name'] : '';
    final String imageUrl = json['promo_items']['basic']['url'];
    final credit1 = json['credits']['by'][0]['name'];
    final credit2 = json['credits']['by'].length >= 2
        ? json['credits']['by'][1]['name']
        : null;
    final first_publish_date = DateTime.parse(json['first_publish_date']);
    final themeTitle = json['label']['basic']['text'];
    final caption = json['promo_items']['basic']['caption'];
    final articlesContenus = json['content_elements'];

    return Article(
      id: json['_id'],
      title: json['headlines']['basic'],
      headlines: json['headlines'],
      contentElements: contentElements,
      primarySectionName: primarySectionName,
      imageUrl: imageUrl,
      subheadlines: json['subheadlines'] as Map<String, dynamic>,
      credit1: credit1,
      credit2: credit2,
      first_publish_date: first_publish_date,
      themeTitle: themeTitle,
      caption: caption,
      articlesContenus: articlesContenus,
    );
  }
}

class ContentElement {
  final String id;
  final String type;
  final String? subtype;
  final Map<String, dynamic>? content;

  ContentElement({
    required this.id,
    required this.type,
    this.subtype,
    this.content,
  });

  factory ContentElement.fromJson(Map<String, dynamic> json) {
    final jsonC = {
      'content': {'content': 'Hello &rld!'}
    };

    return ContentElement(
      id: json['_id'],
      type: json['type'],
      subtype: json['subtype'],
      content: jsonC['content'] != null
          ? json['content'] is Map<String, dynamic>
              ? Map<String, dynamic>.from(json['content'])
              : null
          : null,
    );
  }
}

class ArticleDetailsPage extends StatefulWidget {
  final Article article;

  const ArticleDetailsPage({Key? key, required this.article}) : super(key: key);

  Future<void> _initializeDateFormatting() async {
    await initializeDateFormatting('fr');
  }

  @override
  _ArticleDetailsPageState createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  Widget MyJsonContentWidget(List<ContentElement> contentElements) {
    // print('contentElements length: ${contentElements.length}');

    return Column(
      children: contentElements.map((element) {
        // print('element type: ${element.type}, subtype: ${element.subtype}');
        if (element.type == 'text') {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element.content?['content'] ?? '',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          );
        }
        return Container();
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? imageUrl = 'https://cloudfront-eu-central-1.images.arcpublishing.com/liberation/ZHTZTFYKNRGTRGL6RS4POBYCCM.jpg';

 /*   void imageURL() {
      if (widget.article.imageUrl?.isNotEmpty ?? false) {
        String? imageUrl = widget.article.imageUrl;
        if (imageUrl != null) {
          imageUrl = Uri.parse(imageUrl).toString();
        }
      }
    }*/


    List<Widget> paddingWidgets = [];
    if (widget.article.articlesContenus?.isNotEmpty == true) {
      paddingWidgets.add(
        Padding(
          padding: const EdgeInsets.all(15.0), // le corps de l'article
          child: Text(
            widget.article.articlesContenus!.map((article) {
              if (article['content'] != null) {
                return stripHtmlTags(article['content']) + '\n\n';
              } else {
                return '';
              }
            }).join(),
            style: GoogleFonts.tinos(
                textStyle: TextStyle(
                    color: Colors.black, fontSize: 18, letterSpacing: 0.6)),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: MyAppBarFeed(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8), //Thème
            child: Text(
              widget.article.primarySectionName,
              style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Colors.black45, fontSize: 18, letterSpacing: 0.5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15.0),
            // Titre rouge
            child: Text(widget.article.themeTitle,
                style: GoogleFonts.encodeSansCondensed(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: titleColor,
                        fontSize: 20,
                        letterSpacing: 0.5))),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 2, right: 15),
              // titre noir
              child: Text(
                widget.article.headlines['basic'] ?? '',
                style: GoogleFonts.encodeSansCondensed(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      fontSize: 20,
                      letterSpacing: 0.5),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(15), // premier paragraphe
              child: Text(
                widget.article.subheadlines?['basic'] ?? '',
                style: GoogleFonts.tinos(
                  textStyle: TextStyle(
                      color: Colors.black, fontSize: 18, letterSpacing: 0.6),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 10), //Auteur
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "par ",
                    style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 0.5))),
                TextSpan(
                    text: widget.article.credit1,
                    style: GoogleFonts.sourceSansPro(
                        textStyle: TextStyle(
                            color: Color(0XFFE60004),
                            fontSize: 15,
                            letterSpacing: 0.5))),
                if (widget.article.credit2?.isNotEmpty == true)
                  TextSpan(
                    text: " et ",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                TextSpan(
                  text: widget.article.credit2 ?? '',
                  style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                      color: Color(0XFFE60004),
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              CustomDateFormat("dd MMMM yyyy 'à' HH'h'mm", locale: 'fr').format(
                  widget.article.first_publish_date.add(Duration(hours: 2))),
              style: GoogleFonts.sourceSansPro(
                  textStyle: TextStyle(
                      color: Colors.black45, fontSize: 13, letterSpacing: 0.5)),
            ),
          ),
              () {
            return (imageUrl?.isEmpty ?? true)
                ? Container()
                : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                imageUrl ?? '',
                height: 200,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            );
          }(),
         Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 15),
            child: Text(widget.article.caption ?? '',
                style: GoogleFonts.sourceSansPro(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 0.5))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: paddingWidgets,
          ),
        ],
      ),
      bottomNavigationBar: BottomBarObject(),
    );
  }
}

class CustomDateFormat {
  final String pattern;
  final String locale;

  CustomDateFormat(this.pattern, {required this.locale});

  String format(DateTime dateTime) {
    return DateFormat(pattern, locale).format(dateTime);
  }
}

String stripHtmlTags(String? htmlContent) {
  if (htmlContent == null) {
    return '';
  }
  html_dom.DocumentFragment fragment = html_parser.parseFragment(htmlContent);
  return fragment.text ?? '';
}
