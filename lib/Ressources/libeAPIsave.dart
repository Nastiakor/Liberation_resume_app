import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(LiberationAPI());

class LiberationAPI extends StatefulWidget {
  const LiberationAPI({Key? key}) : super(key: key);

  @override
  _LiberationAPIState createState() => _LiberationAPIState();
}

class _LiberationAPIState extends State<LiberationAPI> {
  final String apiKey = "Vahholu0aiSojahRaish6OaDeihewo";
  final String apiUrl =
      "https://arc.api.liberation.fr/content/v4/search/published";

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
        final data = json.decode(response.body);
        if (data != null && data['content_elements'] != null) {
          setState(() {
            _contentElements =
                List<Map<String, dynamic>>.from(data['content_elements']);
            print(
                "Content elements retrieved, count: ${_contentElements.length}");
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
        appBar: AppBar(
          title: Text('Liberation API'),
        ),
        body: _contentElements.isNotEmpty
            ? ListView.builder(
                itemCount: _contentElements.length,
                itemBuilder: (BuildContext context, int index) {
                  final contentElement = _contentElements[index];
                  final headlines = contentElement['headlines'] ?? {};
                  final canonicalUrl = contentElement['canonical_url'] ?? '';
                  final displayDate = contentElement['display_date'] ?? '';
                  return ListTile(
                    title: Text(headlines['basic'] ?? ''),
                    subtitle: Text(canonicalUrl),
                    trailing: Text(displayDate),
                  );
                },
              )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class Article {
  final String id;
  final String title;
  final Map<String, dynamic> headlines;
  final List<ContentElement> contentElements; // add this line

  Article({
    required this.id,
    required this.title,
    required this.headlines,
    required this.contentElements, // add this line
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    List<dynamic> contentElementsData = json['content_elements'] ?? [];
    List<ContentElement> contentElements = contentElementsData
        .map((element) => ContentElement.fromJson(element))
        .toList();

    return Article(
      id: json['_id'],
      title: json['headlines']['basic'],
      headlines: json['headlines'],
      contentElements: contentElements, // add this line
    );
  }
}

class ContentElement {
  final String id;
  final String type;
  final String? subtype;
  final Map<String, dynamic>? content;

  // add other fields that you need

  ContentElement({
    required this.id,
    required this.type,
    this.subtype,
    this.content,
  });

  factory ContentElement.fromJson(Map<String, dynamic> json) {
    return ContentElement(
      id: json['_id'],
      type: json['type'],
      subtype: json['subtype'],
      content: json['content'],
      // add other fields that you need
    );
  }
}
