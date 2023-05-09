import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';

final DateTime selectedDate = DateTime.now();

class AddArticle extends StatefulWidget {
  const AddArticle({Key? key}) : super(key: key);

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  DateTime? selectedDate;
  final titleHeadlineController = TextEditingController();
  final titleOverlineController = TextEditingController();
  final paragraphMainArticleController = TextEditingController();
  final writtenByController = TextEditingController();
  // final publishDateParamController = DatePickerDialog(
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2023, 5),
  //     lastDate: DateTime(2100));
  final imagePathController = TextEditingController();
  final legendPictureController = TextEditingController();
  final completeArticleController = TextEditingController();
  final categoryController = TextEditingController();
  final typeOfArticleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Column addNewDate() {
      return Column(
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(color: Colors.grey, width: 1.5),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ("Date : ${selectedDate} "),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.arrow_drop_down,
                  ),
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023, 5),
                      lastDate: DateTime(2100),
                    ).then((pickedDate) {
                      if (pickedDate == null) {
                        return;
                      }
                      setState(() {
                        selectedDate = pickedDate;
                      });

                      // mettre à jour selectedDate avec pickedDate ici
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new article'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              newEntries('titleHeadline', titleHeadlineController),
              newEntries('titleOverline', titleOverlineController),
              newEntries(
                  'paragraphMainArticle', paragraphMainArticleController),
              newEntries('writtenBy', writtenByController),
              addNewDate(),
              newEntries('imagePath', imagePathController),
              newEntries('legendPicture', legendPictureController),
              newEntries('completeArticle', completeArticleController),
              newEntries('category', categoryController),
              newEntries('typeOfArticle', typeOfArticleController),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () {
                  FirebaseFirestore.instance.collection('Articles').add({
                    'titleHeadline': titleHeadlineController.value.text,
                    'titleOverline': titleOverlineController.value.text,
                    'paragraphMainArticle':
                        paragraphMainArticleController.value.text,
                    'writtenBy': writtenByController.value.text,
                    'imagePath': imagePathController.value.text,
                    'legendPicture': legendPictureController.value.text,
                    'completeArticle': completeArticleController.value.text,
                    'category': categoryController.value.text,
                    'typeOfArticle': typeOfArticleController.value.text,
                    'publishDateParam': selectedDate,
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