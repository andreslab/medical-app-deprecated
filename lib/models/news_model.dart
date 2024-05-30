class News {
  final String title;
  final String subtitle;
  final String body;
  final DateTime createdAt;

  News(
      {required this.title,
      required this.subtitle,
      required this.body,
      required this.createdAt});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        title: json['title'],
        subtitle: json['subtitle'],
        body: json['body'],
        createdAt: DateTime.parse(json['created_at'] as String));
  }
}
