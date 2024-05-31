class Record {
  int? id;
  DateTime createdAt;
  String? doctorId;
  String? clientId;
  int? systolic;
  int? diastolic;
  int? bpm;
  int? weight;
  int? spO2;

  Record({
    this.id,
    DateTime? createdAt_,
    this.doctorId,
    this.clientId,
    this.systolic,
    this.diastolic,
    this.bpm,
    this.weight,
    this.spO2,
  }) : createdAt = createdAt_ ?? DateTime.now();

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
        id: json['id'],
        createdAt_: DateTime.parse(json['created_at'] as String),
        doctorId: json['doctor_id'],
        clientId: json['client_id'],
        systolic: json['systolic'],
        diastolic: json['diastolic'],
        bpm: json['bpm'],
        weight: json['weight'],
        spO2: json['spo2']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'doctor_id': doctorId,
      'client_id': clientId,
      'systolic': systolic,
      'diastolic': diastolic,
      'bpm': bpm,
      'weight': weight,
      'spo2': spO2,
    };
  }
}
