class Useradgents {
  final String? lastname;
  final String? name;
  final String? photo;
  final String? post;
  final String? content;
  final String? date;
  final String? shortDescription;
  final List<dynamic>? themes;
  final String? title;

  const Useradgents ({
    this.lastname,
    this.name,
    this.photo,
    this.post,
    this.content,
    this.date,
    this.shortDescription,
    this.themes,
    this.title
});
  factory Useradgents.fromJson(Map<String, dynamic> json) {
    return Useradgents(
      lastname: json['lastname']?? '',
      name: json['name']?? '',
      photo: json['photo']?? '',
      post: json['post']?? '',
      content: json['content']?? '',
      date: json['date']?? '',
      shortDescription: json['shortDescription']?? '',
      themes: json['themes']?? '',
      title: json['title']?? ''
    );
  }
}
