import 'package:flutter/material.dart';

class MoisTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> mois = [
      'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet',
      'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'
    ];
    final List<int> annees = [2023, 2022, 2021];

    return DefaultTabController(
      length: mois.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tabs par mois et année'),
          bottom: TabBar(
            tabs: _generateTabs(mois),
          ),
        ),
        body: TabBarView(
          children: _generateTabViews(mois, annees),
        ),
      ),
    );
  }

  List<Widget> _generateTabs(List<String> mois) {
    return mois.map((mois) => Tab(text: mois)).toList();
  }

  List<Widget> _generateTabViews(List<String> mois, List<int> annees) {
    List<Widget> tabViews = [];

    for (int annee in annees) {
      for (String mois in mois) {
        tabViews.add(
          Container(
            child: Center(
              child: Text('Contenu pour $mois $annee'),
            ),
          ),
        );
      }
    }

    return tabViews;
  }
}
