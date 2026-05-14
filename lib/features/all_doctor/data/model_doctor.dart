class DoctorsResponse {
  final String message;
  final List<DoctorModel> data;
  final bool status;
  final int code;

  DoctorsResponse({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory DoctorsResponse.fromJson(Map<String, dynamic> json) {
    return DoctorsResponse(
      message: json['message'] ?? '',
      data: json['data'] == null
          ? []
          : List<DoctorModel>.from(
        json['data'].map((item) => DoctorModel.fromJson(item)),
      ),
      status: json['status'] ?? false,
      code: json['code'] ?? 0,
    );
  }
}

class DoctorModel {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String photo;
  final String gender;
  final String address;
  final String description;
  final String degree;
  final SpecializationModel specialization;
  final CityModel city;
  final int appointPrice;
  final String startTime;
  final String endTime;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.photo,
    required this.gender,
    required this.address,
    required this.description,
    required this.degree,
    required this.specialization,
    required this.city,
    required this.appointPrice,
    required this.startTime,
    required this.endTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      photo: json['photo'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      description: json['description'] ?? '',
      degree: json['degree'] ?? '',
      specialization: SpecializationModel.fromJson(
        json['specialization'] ?? {},
      ),
      city: CityModel.fromJson(json['city'] ?? {}),
      appointPrice: json['appoint_price'] ?? 0,
      startTime: json['start_time'] ?? '',
      endTime: json['end_time'] ?? '',
    );
  }
}

class SpecializationModel {
  final int id;
  final String name;

  SpecializationModel({
    required this.id,
    required this.name,
  });

  factory SpecializationModel.fromJson(Map<String, dynamic> json) {
    return SpecializationModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}

class CityModel {
  final int id;
  final String name;
  final GovernrateModel governrate;

  CityModel({
    required this.id,
    required this.name,
    required this.governrate,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      governrate: GovernrateModel.fromJson(json['governrate'] ?? {}),
    );
  }
}

class GovernrateModel {
  final int id;
  final String name;

  GovernrateModel({
    required this.id,
    required this.name,
  });

  factory GovernrateModel.fromJson(Map<String, dynamic> json) {
    return GovernrateModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
    );
  }
}