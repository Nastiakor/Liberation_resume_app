import 'package:flutter/material.dart';
import 'package:cv_flutter_libe/views/pages/useradgetsFullArticle.dart';
import 'package:cv_flutter_libe/services/useradgents_service.dart';
import 'package:cv_flutter_libe/models/useradgents.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';

class UseradgentsPage extends StatefulWidget {
  const UseradgentsPage({Key? key}) : super(key: key);

  @override
  State<UseradgentsPage> createState() => _UseradgentsPageState();
}

class _UseradgentsPageState extends State<UseradgentsPage> {
  List<Useradgents> _UseradgentsContent = [];

  @override
  void initState() {
    super.initState();
    _fetchUseradgentsJSON();
  }

  _fetchUseradgentsJSON() async {
    var response = await UseradgentsService.fetchUseradgentsFeed();
    print(response);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);

      List<Useradgents> useradgentsList =
      jsonResponse.map((data) => Useradgents.fromJson(data)).toList();
      setState(() {
        _UseradgentsContent = useradgentsList;
      });
      print('first title${useradgentsList[0].title}');
    } else {
      print('Erreur lors de la récupération des données');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Useradgents feed',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Helvetica',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Useradgents'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: _UseradgentsContent.length,
          itemBuilder: (context, i) {
            final useradgents = _UseradgentsContent[i];

            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          UseradgentsFullArticle(useradgents: useradgents),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                        child: useradgents.featuredImages != null && useradgents.featuredImages!.isNotEmpty
                            ? Image.network(useradgents.featuredImages!.first.src ?? '', height: 200, width: double.infinity, fit: BoxFit.cover)
                            : Container(color: Colors.grey, height: 200, width: double.infinity),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              useradgents.title ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            Html(
                              data: useradgents.shortDescription ?? '',
                              style: {
                                "body": Style(
                                  fontSize: FontSize(14),
                                  color: Colors.grey,
                                ),
                              },
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                if (useradgents.authors != null && useradgents.authors!.isNotEmpty)
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(useradgents.authors!.first.photo ?? ''),
                                  ),
                                SizedBox(width: 8),
                                if (useradgents.authors != null && useradgents.authors!.isNotEmpty)
                                  Text(
                                    "${useradgents.authors!.first.name} ${useradgents.authors!.first.lastname}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}
