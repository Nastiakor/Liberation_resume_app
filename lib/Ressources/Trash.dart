/*
class firstHomeArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var widthMax = size.width;
    var platform = Theme.of(context).platform;
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: megaGigaFunction(
            "WANTED ",
            'DEUX ÉTUDIANTS POSSÉDANT DE FORTES COMPÉTENCES EN FLUTTER. RÉCOMPENSE: ALTERNANCE',
            "Plus à l'aise à domicile sur leurs terrains de prédilection (Dart, JavaScript, C#), ils sont complètement adaptables à d'autres contraintes techniques (Swift, Kotlin, Java, PHP...).",
            "Anastasia Korotkova",
            "2023-02-10",
            "img/85808-cherche-ancien-affiche-vectoriel.jpg",
            "En recherche d'alternance pour la période de mi-juillet 2023 à mi-juin 2024 sur un rythme de 4 jours sur 5 en entreprise",
            "Ils ont le bénéfice de leur grand âge, en capacité à résister à la pression, apprécie le travail en équipe, empathiques et de grandes qualités relationnelles. Ils savent aussi se mettre au diapason de la dynamique collective et s'y fondre.",
            "$widthMax"),),
    );
  }
}*/

/*double _fontSize = 16.0;
double _selectedFontSize = 16.0;

void _updateFontSize(double newSize) {
  setState(() {
    _fontSize = newSize;
  });
}

void _handleFontSizeTap() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Sélectionner la taille de la police'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              RadioListTile(
                title: Text('Petit'),
                value: 12.0,
                groupValue: _selectedFontSize,
                onChanged: (value) {
                  _updateFontSize(value!);
                  _selectedFontSize = value;
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Moyen'),
                value: 16.0,
                groupValue: _selectedFontSize,
                onChanged: (value) {
                  _updateFontSize(value!);
                  _selectedFontSize = value;
                  Navigator.pop(context);
                },
              ),
              RadioListTile(
                title: Text('Grand'),
                value: 20.0,
                groupValue: _selectedFontSize,
                onChanged: (value) {
                  _updateFontSize(value!);
                  _selectedFontSize = value;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}*/
