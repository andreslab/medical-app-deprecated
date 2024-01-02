class Record {
  final double sys;
  final double dia;
  final double pulse;
  final String createAt;

  Record(
      {required this.sys,
      required this.dia,
      required this.pulse,
      required this.createAt});

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
        sys: json['sys'],
        dia: json['dia'],
        pulse: json['pulse'],
        createAt: json['createAt']);
  }
}
