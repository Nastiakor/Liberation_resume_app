class Useradgents {
  final String lastname;
  final String name;
  final String photo;
  final String post;
  final String content;
  final DateTime date;
  final String shortDescription;
  final List<String> themes;
  final String title;

  const Useradgents ({
    required this.lastname,
    required this.name,
    required this.photo,
    required this.post,
    required this.content,
    required this.date,
    required this.shortDescription,
    required this.themes,
    required this.title
});
  factory Useradgents.fromJson(Map<String, dynamic> json) {
    return Useradgents(
      lastname: json['lastname'],
      name: json['name'],
      photo: json['photo'],
      post: json['post'],
      content: json['content'],
      date: json['date'],
      shortDescription: json['shortDescription'],
      themes: json['themes'],
      title: json['title']
    );
  }
}
