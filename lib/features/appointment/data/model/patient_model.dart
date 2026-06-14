class PatientModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;

  PatientModel({this.id, this.name, this.email, this.phone, this.gender});

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      gender: json['gender'],
    );
  }
}