class Alarm {
  final int id;
  final String title;
  final String time;
  final String body;
  final DateTime createdAt;

  Alarm(
      {required this.id,
      required this.title,
      required this.time,
      required this.body,
      required this.createdAt});

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
        id: json['id'],
        title: json['title'],
        time: json['time'],
        body: json['body'],
        createdAt: DateTime.parse(json['created_at'] as String));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'body': body,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
