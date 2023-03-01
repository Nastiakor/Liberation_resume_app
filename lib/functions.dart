String calculatePublishingDate(DateTime publishingDate) {
  DateTime now = DateTime.now();
  DateTime howLongFromNow =
      DateTime(publishingDate.year, publishingDate.month, publishingDate.day);

  Duration duration = now.difference(howLongFromNow);
  int durationInDays = duration.inDays;
  if (durationInDays == 1) {
    return "Publié il y a $durationInDays jour";
  } else {
    return "Publié il y a $durationInDays jours";
  }
}
