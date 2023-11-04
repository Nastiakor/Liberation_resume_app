import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cv_flutter_libe/views/pages/useradgentsFullArticle.dart';
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

class _UseradgentsPageState extends State<UseradgentsPage>
    with TickerProviderStateMixin {
  List<Useradgents> _useradgentsContent = [];
  List<AnimationController> _animationControllers = [];
  bool _isLoading = true;

  List<String> _months = [
    'Décembre',
    'Novembre',
    'Octobre',
    'Septembre',
    'Août',
    'Juillet',
    'Juin',
    'Mai',
    'Avril',
    'Mars',
    'Février',
    'Janvier',
  ];

  List<String> _years = [
    '2023',
    '2022',
    '2021',
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _fetchUseradgentsJSON();
    _tabController = TabController(vsync: this, length: _years.length);
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

      useradgentsList.sort((a, b) => b.date!.compareTo(a.date!));

      _animationControllers = List.generate(useradgentsList.length, (index) {
        return AnimationController(
          duration: const Duration(milliseconds: 500),
          vsync: this,
        );
      });

      setState(() {
        _useradgentsContent = useradgentsList;
        _isLoading = false;
      });

      for (var i = 0; i < _animationControllers.length; i++) {
        Future.delayed(Duration(milliseconds: 300 * i), () {
          _animationControllers[i].forward();
        });
      }

      print('First title: ${useradgentsList[0].title}');
    } else {
      print('Error fetching data');
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
          title: const Text('Useradgents'),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: TabBar(
            controller: _tabController,
            tabs: _years.map((year) => Tab(text: year)).toList(),
          ),
        ),
        body: _isLoading
            ? const Center(
          child: SpinKitFoldingCube(
            color: Colors.pinkAccent,
            size: 50.0,
          ),
        )
            : TabBarView(
          controller: _tabController,
          children: _years.map((year) {
            return ListView.builder(
              itemCount: _months.length,
              itemBuilder: (context, monthIndex) {
                List<Useradgents> articlesByMonthAndYear =
                _useradgentsContent.where((article) =>
                article.date!.month == 12 - monthIndex &&
                    article.date!.year.toString() == year).toList();

                if (articlesByMonthAndYear.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${_months[monthIndex]} $year',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ...articlesByMonthAndYear.map((useradgents) {
                        return AnimatedBuilder(
                          animation: _animationControllers[
                          _useradgentsContent.indexOf(useradgents)],
                          builder: (context, child) {
                            double val = _animationControllers[
                            _useradgentsContent.indexOf(useradgents)]
                                .value;
                            return Transform(
                              transform: Matrix4.translationValues(
                                MediaQuery.of(context).size.width *
                                    (1 - val),
                                0,
                                0,
                              ),
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
                                        UseradgentsFullArticle(
                                          useradgents: useradgents,
                                        ),
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
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(15),
                                      ),
                                      child: useradgents.featuredImages !=
                                          null &&
                                          useradgents.featuredImages!
                                              .isNotEmpty
                                          ? Image.network(
                                        useradgents.featuredImages!
                                            .first.src ??
                                            '',
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
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            useradgents.title ?? '',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Html(
                                            data: useradgents.shortDescription ?? '',
                                            style: {
                                              "body": Style(
                                                fontSize: FontSize(14),
                                                color: Colors.grey,
                                              ),
                                            },
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              if (useradgents.authors != null &&
                                                  useradgents.authors!.isNotEmpty)
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    useradgents.authors!.first.photo ??
                                                        '',
                                                  ),
                                                ),
                                              const SizedBox(width: 8),
                                              if (useradgents.authors != null &&
                                                  useradgents.authors!.isNotEmpty)
                                                Text(
                                                  "${useradgents.authors!.first.name} ${useradgents.authors!.first.lastname}",
                                                  style: const TextStyle(
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
                      }).toList(),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            );
          }).toList(),
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
