// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'package:ride_project/core/config/handling_model.dart';

// class BicycleCategoryModel extends ResultModel {
//   String message;
//   String status;
//   DateTime localDateTime;
//   List<String> body;
//   BicycleCategoryModel({
//     required this.message,
//     required this.status,
//     required this.localDateTime,
//     required this.body,
//   });

//   BicycleCategoryModel copyWith({
//     String? message,
//     String? status,
//     DateTime? localDateTime,
//     List<String>? body,
//   }) {
//     return BicycleCategoryModel(
//       message: message ?? this.message,
//       status: status ?? this.status,
//       localDateTime: localDateTime ?? this.localDateTime,
//       body: body ?? this.body,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'message': message,
//       'status': status,
//       'localDateTime': localDateTime.millisecondsSinceEpoch,
//       'body': body,
//     };
//   }

//   factory BicycleCategoryModel.fromMap(Map<String, dynamic> map) {
//     return BicycleCategoryModel(
//       message: map['message'] as String,
//       status: map['status'] as String,
//       localDateTime:
//           DateTime.fromMillisecondsSinceEpoch(map['localDateTime'] as int),
//       body: List<String>.from((map['body'] as List<String>)),
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory BicycleCategoryModel.fromJson(String source) =>
//       BicycleCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'BicycleCategoryModel(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
//   }

//   @override
//   bool operator ==(covariant BicycleCategoryModel other) {
//     if (identical(this, other)) return true;

//     return other.message == message &&
//         other.status == status &&
//         other.localDateTime == localDateTime &&
//         listEquals(other.body, body);
//   }

//   @override
//   int get hashCode {
//     return message.hashCode ^
//         status.hashCode ^
//         localDateTime.hashCode ^
//         body.hashCode;
//   }
// }

class BicycleCategoryModel {
  String message;
  String status;
  DateTime localDateTime;
  List<String> body;

  BicycleCategoryModel({
    required this.message,
    required this.status,
    required this.localDateTime,
    required this.body,
  });

  factory BicycleCategoryModel.fromJson(Map<String, dynamic> json) =>
      BicycleCategoryModel(
        message: json["message"],
        status: json["status"],
        localDateTime: DateTime.parse(json["localDateTime"]),
        body: List<String>.from(json["body"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "localDateTime": localDateTime.toIso8601String(),
        "body": List<dynamic>.from(body.map((x) => x)),
      };
}
