import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recommendations extends StatefulWidget {
  const Recommendations({Key? key}) : super(key: key);

  @override
  State<Recommendations> createState() => _RecommendationsState();
}

class _RecommendationsState extends State<Recommendations> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                text: "LAISSEZ-NOUS UNE RECOMMANDATION",
                style: GoogleFonts.encodeSansCondensed(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.purple,
                      fontSize: 20,
                      letterSpacing: 0.6),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              maxLines: 15,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'Veuillez saisir votre message ici',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
