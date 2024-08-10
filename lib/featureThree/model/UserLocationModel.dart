// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../core/config/handling_model.dart';

class User_location_model extends ResultModel {
  double latitude;
  double longtitude;
  User_location_model({
    required this.latitude,
    required this.longtitude,
  });

  User_location_model copyWith({
    double? latitude,
    double? longtitude,
  }) {
    return User_location_model(
      latitude: latitude ?? this.latitude,
      longtitude: longtitude ?? this.longtitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longtitude': longtitude,
    };
  }

  factory User_location_model.fromMap(Map<String, dynamic> map) {
    return User_location_model(
      latitude: map['latitude'] as double,
      longtitude: map['longtitude'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory User_location_model.fromJson(String source) => User_location_model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User_location_model(latitude: $latitude, longtitude: $longtitude)';

  @override
  bool operator ==(covariant User_location_model other) {
    if (identical(this, other)) return true;
  
    return 
      other.latitude == latitude &&
      other.longtitude == longtitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longtitude.hashCode;
}
