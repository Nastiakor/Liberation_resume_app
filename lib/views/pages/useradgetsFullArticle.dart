import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cv_flutter_libe/models/useradgents.dart';
import 'package:flutter_html/flutter_html.dart';

class UseradgentsFullArticle extends StatelessWidget {
  final Useradgents useradgents;

  UseradgentsFullArticle({required this.useradgents});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMMM', 'fr_FR').format(DateTime.parse(useradgents.date ?? ''));

    return Scaffold(
      appBar: AppBar(
        title: Text(useradgents.title ?? ''),
      ),
      body: ListView(
        children: [
          if (useradgents.featuredImages != null && useradgents.featuredImages!.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: useradgents.featuredImages!.length,
              itemBuilder: (context, index) {
                final featuredImage = useradgents.featuredImages![index];
                return Image.network(
                  featuredImage.src ?? '',
                  fit: BoxFit.cover,
                );
              },
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (useradgents.authors != null && useradgents.authors!.isNotEmpty)
                  Text(
                    '${useradgents.authors!.first.name} ${useradgents.authors!.first.lastname}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                SizedBox(height: 4),
                if (useradgents.authors != null && useradgents.authors!.isNotEmpty)
                  Text(
                    useradgents.authors!.first.post ?? '',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '•',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Lecture ${useradgents.readingTime ?? 0} minutes',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                if (useradgents.authors != null && useradgents.authors!.isNotEmpty)
                  CircleAvatar(
                    backgroundImage: NetworkImage(useradgents.authors!.first.photo ?? ''),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Html(data: useradgents.content ?? ''),
          ),
          // ... autres informations à afficher
        ],
      ),
    );
  }
}
