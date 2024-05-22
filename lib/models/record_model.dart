class Record {
  final DateTime createdAt;
  final String? doctorId;
  final String clientId;
  final int systolic;
  final int diastolic;
  final int bpm;
  final int? weight;
  final int? spO2;

  Record(
      {required this.createdAt,
      this.doctorId,
      required this.clientId,
      required this.systolic,
      required this.diastolic,
      required this.bpm,
      this.weight,
      this.spO2});

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
        createdAt: DateTime.parse(json['created_at'] as String),
        doctorId: json['doctor_id'],
        clientId: json['client_id'],
        systolic: json['systolic'],
        diastolic: json['diastolic'],
        bpm: json['bpm'],
        weight: json['weight'],
        spO2: json['spo2']);
  }
}
