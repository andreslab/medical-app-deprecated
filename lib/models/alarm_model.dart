class Alarm {
  final String title;
  final String time;
  final String body;
  final String createAt;

  Alarm(
      {required this.title,
      required this.time,
      required this.body,
      required this.createAt});

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
        title: json['title'],
        time: json['time'],
        body: json['body'],
        createAt: json['createAt']);
  }
}
