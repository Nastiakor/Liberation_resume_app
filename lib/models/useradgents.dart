class Author {
  final String? name;
  final String? lastname;
  final String? post;
  final String? photo;

  Author({
    this.name,
    this.lastname,
    this.post,
    this.photo,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name']?? '',
      lastname: json['lastname']?? '',
      post: json['post']?? '',
      photo: json['photo']?? '',
    );
  }
}

class FeaturedImage {
  final String? type;
  final String? src;

  FeaturedImage({
    this.type,
    this.src,
  });

  factory FeaturedImage.fromJson(Map<String, dynamic> json) {
    return FeaturedImage(
      type: json['type']?? '',
      src: json['src']?? '',
    );
  }
}

class Useradgents {
  final String? lastname;
  final String? name;
  final String? photo;
  final String? post;
  final String? content;
  final DateTime? date; // Modifier le type en DateTime
  final String? shortDescription;
  final List<dynamic>? themes;
  final String? title;
  final List<Author>? authors;
  final List<FeaturedImage>? featuredImages;
  final String? readingTime; // Ajout du champ readingTime

  const Useradgents({
    this.lastname,
    this.name,
    this.photo,
    this.post,
    this.content,
    this.date,
    this.shortDescription,
    this.themes,
    this.title,
    this.authors,
    this.featuredImages,
    this.readingTime,
  });

  factory Useradgents.fromJson(Map<String, dynamic> json) {
    List<Author> authors = List<Map<String, dynamic>>.from(json['authors'])
        .map((authorJson) => Author.fromJson(authorJson))
        .toList();

    List<FeaturedImage> featuredImages = List<Map<String, dynamic>>.from(json['featuredMedias'])
        .map((imageJson) => FeaturedImage.fromJson(imageJson))
        .toList();

    return Useradgents(
      lastname: json['lastname'] ?? '',
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
      post: json['post'] ?? '',
      content: json['content'] ?? '',
      date: DateTime.parse(json['date'] ?? ''), // Parse la chaîne en DateTime
      shortDescription: json['shortDescription'] ?? '',
      themes: json['themes'] ?? '',
      title: json['title'] ?? '',
      authors: authors,
      featuredImages: featuredImages,
      readingTime: json['readingTime'], // Lecture du champ readingTime
    );
  }
}



