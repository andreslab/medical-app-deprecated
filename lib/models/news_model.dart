class News {
  final String title;
  final String subtitle;
  final String body;
  final String createAt;

  News(
      {required this.title,
      required this.subtitle,
      required this.body,
      required this.createAt});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['title'],
        subtitle: json['subtitle'],
        body: json['body'],
        createAt: json['createAt']);
  }
}
