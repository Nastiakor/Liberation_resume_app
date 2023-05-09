import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({Key? key}) : super(key: key);

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  final headlineController = TextEditingController();
  final titleHeadlineController = TextEditingController();
  final titleOverlineController = TextEditingController();
  final paragraphMainArticleController = TextEditingController();
  final writtenByController = TextEditingController();
  final publishDateParamController = TextEditingController();
  final imagePathController = TextEditingController();
  final legendPictureController = TextEditingController();
  final completeArticleController = TextEditingController();
  final categoryController = TextEditingController();
  final typeOfArticleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new article'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              newEntries('titleHeadline', headlineController),
              newEntries('titleOverline', headlineController),
              newEntries('paragraphMainArticle', headlineController),
              newEntries('writtenBy', headlineController),
              newEntries('publishDateParam', headlineController),
              newEntries('imagePath', headlineController),
              newEntries('legendPicture', headlineController),
              newEntries('completeArticle', headlineController),
              newEntries('category', headlineController),
              newEntries('typeOfArticle', headlineController),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  FirebaseFirestore.instance.collection('Articles').add({
                    'titleHeadline': headlineController.value.text,
                  });
                },
                child: Text('Ajouter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Column newEntries(name, controller) {
  return Column(
    children: [
      ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: Colors.grey, width: 1.5),
        ),
        title: Row(children: [
          Text('${name} : '),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              controller: controller,
            ),
          ),
        ]),
      ),
      const SizedBox(height: 20),
    ],
  );
}
