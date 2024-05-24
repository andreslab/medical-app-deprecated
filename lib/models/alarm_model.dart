class Alarm {
  final int id;
  final String title;
  final String time;
  final String body;
  final String createAt;

  Alarm(
      {required this.id,
      required this.title,
      required this.time,
      required this.body,
      required this.createAt});

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
        id: json['id'],
        title: json['title'],
        time: json['time'],
        body: json['body'],
        createAt: json['createAt']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'body': body,
      'createAt': createAt,
    };
  }
}
