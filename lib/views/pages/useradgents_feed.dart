import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cv_flutter_libe/views/pages/useradgetsFullArticle.dart';
import 'package:cv_flutter_libe/services/useradgents_service.dart';
import 'package:cv_flutter_libe/models/useradgents.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import 'package:cv_flutter_libe/views/components/bottom_navigation_bar.dart';

class UseradgentsPage extends StatefulWidget {
  const UseradgentsPage({Key? key}) : super(key: key);

  @override
  State<UseradgentsPage> createState() => _UseradgentsPageState();
}

class _UseradgentsPageState extends State<UseradgentsPage> with TickerProviderStateMixin {
  List<Useradgents> _UseradgentsContent = [];
  List<AnimationController> _animationControllers = [];
  bool _isLoading = true;
  int _currentPage = 1;
  static const _itemsPerPage = 5; // Nombre d'articles par page

  @override
  void initState() {
    super.initState();
    _fetchUseradgentsJSON();
  }

  _fetchUseradgentsJSON() async {
    setState(() {
      _isLoading = true;
    });

    var response = await UseradgentsService.fetchUseradgentsFeed();
    print(response);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);

      List<Useradgents> useradgentsList =
      jsonResponse.map((data) => Useradgents.fromJson(data)).toList();

      _animationControllers = List.generate(useradgentsList.length, (index) {
        return AnimationController(
          duration: const Duration(milliseconds: 500),
          vsync: this,
        );
      });

      setState(() {
        _UseradgentsContent = useradgentsList;
        _isLoading = false;
      });

      for (var i = 0; i < _animationControllers.length; i++) {
        Future.delayed(Duration(milliseconds: 300 * i), () {
          _animationControllers[i].forward();
        });
      }

      print('first title${useradgentsList[0].title}');
    } else {
      print('Erreur lors de la récupération des données');
    }
  }

  @override
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
        body: _isLoading
            ? Center(
          child: SpinKitFoldingCube(
            color: Colors.pinkAccent,
            size: 50.0,
          ),
        )
            : Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _itemsPerPage,
                itemBuilder: (context, i) {
                  int index = (_currentPage - 1) * _itemsPerPage + i;
                  if (_animationControllers.length <= index) {
                    return Container();
                  }
                  if (index >= _UseradgentsContent.length) {
                    return Container();
                  }
                  final useradgents = _UseradgentsContent[index];

                  return AnimatedBuilder(
                    animation: _animationControllers[index],
                    builder: (context, child) {
                      double val = _animationControllers[index].value;
                      return Transform(
                        transform: Matrix4.translationValues(
                            MediaQuery.of(context).size.width * (1 - val), 0, 0),
                        child: child,
                      );
                    },
                    child: Padding(
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
                                child: useradgents.featuredImages != null &&
                                    useradgents.featuredImages!.isNotEmpty
                                    ? Image.network(
                                  useradgents.featuredImages!.first.src ?? '',
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                )
                                    : Container(
                                  color: Colors.grey,
                                  height: 200,
                                  width: double.infinity,
                                ),
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
                                        if (useradgents.authors != null &&
                                            useradgents.authors!.isNotEmpty)
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                useradgents.authors!.first.photo ?? ''),
                                          ),
                                        SizedBox(width: 8),
                                        if (useradgents.authors != null &&
                                            useradgents.authors!.isNotEmpty)
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
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _currentPage > 1
                      ? () {
                    setState(() {
                      _currentPage--;
                    });
                  }
                      : null,
                  child: Text('Précédent'),
                ),
                ElevatedButton(
                  onPressed: (_currentPage * _itemsPerPage) < _UseradgentsContent.length
                      ? () {
                    setState(() {
                      _currentPage++;
                    });
                  }
                      : null,
                  child: Text('Suivant'),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: MyBottomHomeNavigationBar(currentIndex: 3),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _animationControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
