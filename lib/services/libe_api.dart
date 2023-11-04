import 'dart:convert';
import 'package:cv_flutter_libe/services/tokens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cv_flutter_libe/views/components/app_bar.dart';
import 'package:cv_flutter_libe/views/components/bottom_navigation_bar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:cv_flutter_libe/views/components/bottom_bar_article.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as html_dom;

const titleColor = Color(0XFFE60004);
final unescape = HtmlUnescape();

void main() => runApp(const LiberationAPI());

class LiberationAPI extends StatefulWidget {
  const LiberationAPI({Key? key}) : super(key: key);

  @override
  LiberationAPIState createState() => LiberationAPIState();
}

class LiberationAPIState extends State<LiberationAPI> {
  String apiKey = tokenLibe;
  final String apiUrl = "https://arc.api.liberation.fr/content/v4/search/published";

  List<Map<String, dynamic>> _contentElements = [];

  Future<void> _fetchArticles() async {
    try {
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
        // ignore: unnecessary_null_comparison
        if (data != null && data['content_elements'] != null) {
          setState(() {
            _contentElements =
                List<Map<String, dynamic>>.from(data['content_elements']);
            //print(
               // "Content elements retrieved, count: ${_contentElements.length}");
          });
        }
      } else {
        throw Exception('Failed to fetch articles');
      }
    } catch (error) {
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
        appBar: AppBarFeed(),
        body: _contentElements.isEmpty
            ? const Center(child: CircularProgressIndicator())
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
                                //final canonicalUrl =
                                  //  contentElement['canonical_url'] ?? '';
                                final displayDate =
                                    contentElement['display_date'] ?? '';
                                final dateTime = DateTime.parse(displayDate)
                                    .add(const Duration(hours: 2));
                                final hourFormat = DateFormat('HH:mm');
                                final formattedHour =
                                    hourFormat.format(dateTime);
                                final abonnes = contentElement['content_restrictions']['content_code'];

                                String pourAbonnes() {
                                  if (abonnes == "ouvert") {
                                    return "";
                                  }
                                  else {return "Article offert par Anastasia et Johan";}
                                }
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
                                          padding: const EdgeInsets.only(top: 5),
                                          child: Column(
                                            children: [
                                              Text(
                                                formattedHour,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                headlines['basic'] ?? '',
                                                style: GoogleFonts
                                                    .encodeSansCondensed(
                                                        textStyle: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            letterSpacing:
                                                                0.5)),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                primarySectionName ?? '',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black45,
                                                    fontSize: 13),
                                              ),
                                              abonnes == "ferme" ?
                                                 Padding(padding: const EdgeInsets.only(top : 5, left: 0),
                                                child: Text(pourAbonnes(),
                                                  style: GoogleFonts.encodeSansCondensed(
                                                    textStyle: const TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.amber,
                                                        fontSize: 13,
                                                        letterSpacing: 0.5),
                                                  ),
                                                ),
                                              ) : Container(),
                                              const SizedBox(height: 10),
                                              const Divider(
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
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Center(child: CircularProgressIndicator())
                          ],
                        )
                ],
              ),
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 2),
      ),
    );
  }
}

// a déplacer dans un autre fichier pour du clean code
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
  final DateTime firstPublishDate;
  final String themeTitle;
  final String? caption;
  final List<dynamic>? articlesContenus;
  final String? abonnes;

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
    required this.firstPublishDate,
    required this.themeTitle,
    this.caption,
    this.articlesContenus,
    this.abonnes,
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
    final firstPublishDate = DateTime.parse(json['first_publish_date']);
    final themeTitle = json['label']['basic']['text'];
    final caption = json['promo_items']['basic']['caption'];
    final articlesContenus = json['content_elements'];
    final abonnes = json['content_restrictions']['content_code'];


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
      firstPublishDate: firstPublishDate,
      themeTitle: themeTitle,
      caption: caption,
      articlesContenus: articlesContenus,
      abonnes: abonnes,
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
  ArticleDetailsPageState createState() => ArticleDetailsPageState();
}

class ArticleDetailsPageState extends State<ArticleDetailsPage> {
  Widget myJsonContentWidget(List<ContentElement> contentElements) {
    // print('contentElements length: ${contentElements.length}');

    return Column(
      children: contentElements.map((element) {
        // print('element type: ${element.type}, subtype: ${element.subtype}');
        if (element.type == 'text') {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element.content?['content'] ?? '',
              style: const TextStyle(
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
    String? imageUrl = widget.article.imageUrl;
    String pourAbonnes() {
      if (widget.article.abonnes == "ouvert") {
        return "";
      }
      else {return "Article offert";}
    }

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
                textStyle: const TextStyle(
                    color: Colors.black, fontSize: 18, letterSpacing: 0.6)),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBarFeed(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8), // Thème
            child: Text(
              widget.article.primarySectionName,
              style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
                      color: Colors.black45, fontSize: 18, letterSpacing: 0.5)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15.0),
            // Titre rouge
            child: Text(widget.article.themeTitle,
                style: GoogleFonts.encodeSansCondensed(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
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
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
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
                  textStyle: const TextStyle(
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
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 0.5))),
                TextSpan(
                    text: widget.article.credit1,
                    style: GoogleFonts.sourceSansPro(
                        textStyle: const TextStyle(
                            color: Color(0XFFE60004),
                            fontSize: 15,
                            letterSpacing: 0.5))),
                if (widget.article.credit2?.isNotEmpty == true)
                  TextSpan(
                    text: " et ",
                    style: GoogleFonts.sourceSansPro(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                TextSpan(
                  text: widget.article.credit2 ?? '',
                  style: GoogleFonts.sourceSansPro(
                    textStyle: const TextStyle(
                      color: Color(0XFFE60004),
                      fontSize: 15,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ]),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 15.0, bottom: 5),
            child: Text(pourAbonnes(),
              style: GoogleFonts.encodeSansCondensed(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.amber,
                    fontSize: 13,
                    letterSpacing: 0.5),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              CustomDateFormat("dd MMMM yyyy 'à' HH'h'mm", locale: 'fr').format(
                  widget.article.firstPublishDate.add(const Duration(hours: 2))),
              style: GoogleFonts.sourceSansPro(
                  textStyle: const TextStyle(
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
                    textStyle: const TextStyle(
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
      bottomNavigationBar: const BottomBarArticle(),
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
