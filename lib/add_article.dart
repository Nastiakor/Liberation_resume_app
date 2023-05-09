import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({Key? key}) : super(key: key);

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
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
              newEntries('titleHeadline', titleHeadlineController),
              newEntries('titleOverline', titleOverlineController),
              newEntries(
                  'paragraphMainArticle', paragraphMainArticleController),
              newEntries('writtenBy', writtenByController),
              dateEntry(),
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
                    'publishDateParam': publishDateParamController.value.text,
                    'imagePath': imagePathController.value.text,
                    'legendPicture': legendPictureController.value.text,
                    'completeArticle': completeArticleController.value.text,
                    'category': categoryController.value.text,
                    'typeOfArticle': typeOfArticleController.value.text,
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

DateTimePicker dateEntry() {
  return DateTimePicker(
    type: DateTimePickerType.dateTimeSeparate,
    dateMask: 'd MMM, yyyy',
    initialValue: DateTime.now().toString(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
    icon: Icon(Icons.event),
    dateLabelText: 'Date',
    timeLabelText: "Hour",
    selectableDayPredicate: (date) {
// Disable weekend days to select from the calendar
      if (date.weekday == 6 || date.weekday == 7) {
        return false;
      }

      return true;
    },
    onChanged: (val) => print(val),
    validator: (val) {
      print(val);
      return null;
    },
    onSaved: (val) => print(val),
  );
}
