import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
// image picker
pickImage(ImageSource source) async {
final ImagePicker _imagePicker = ImagePicker();
XFile? _file = await _imagePicker.pickImage(source: source);
if(_file != null) {
  return await _file.readAsBytes();
}
}

String calculatePublishingDate(DateTime publishingDate) {
  DateTime now = DateTime.now();
  DateTime howLongFromNow = DateTime(publishingDate.year, publishingDate.month,
      publishingDate.day, publishingDate.hour, publishingDate.minute);
  Duration duration = now.difference(howLongFromNow);
  int durationInDays = duration.inDays;
  int durationinMinutes = duration.inMinutes;
  int durationinHours = duration.inHours;
  if (durationInDays == 1) {
    return "$durationInDays jour";
  } else if (durationInDays > 1) {
    return "$durationInDays jours";
  } else if (durationinHours < 1 && durationinMinutes > 1) {
    return "$durationinMinutes minutes";
  } else if (durationinMinutes <= 1) {
    return "$durationinMinutes minute";
  } else if (durationinHours > 1 && durationinHours < 24) {
    return "$durationinHours heures";
  } else if (durationinHours == 1) {
    return "$durationinHours heure";
  } else
    return "erreur";
}

Future<void> _launchURL(String link) async {
  final Uri _url = Uri.parse(link);
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}