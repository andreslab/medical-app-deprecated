class Alarm {
  int? id;
  String? title;
  String? time;
  String? body;
  DateTime createdAt;

  Alarm({
    this.id,
    this.title,
    this.time,
    this.body,
    DateTime? createdAt_,
  }) : createdAt = createdAt_ ?? DateTime.now();

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      id: json['id'],
      title: json['title'],
      time: json['time'],
      body: json['body'],
      createdAt_: DateTime.parse(json['created_at'] as String),
    );
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
