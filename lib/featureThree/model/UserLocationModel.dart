import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserLocationModel {
  double latitude;
  double longitude;
  UserLocationModel({
    required this.latitude,
    required this.longitude,
  });

  UserLocationModel copyWith({
    double? latitude,
    double? longitude,
  }) {
    return UserLocationModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory UserLocationModel.fromMap(Map<String, dynamic> map) {
    return UserLocationModel(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocationModel.fromJson(String source) =>
      UserLocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserLocationModel(latitude: $latitude, longitude: $longitude)';

  @override
  bool operator ==(covariant UserLocationModel other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude && other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
