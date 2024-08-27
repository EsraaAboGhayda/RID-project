// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ride_project/core/config/handling_model.dart';

class BicycleByCategoryModel extends ResultModel {
  String? message = "Get bicycles by category";
  String? status = "ACCEPTED";
  DateTime? localDateTime;
  List<bicycle>? body;

  BicycleByCategoryModel({
    this.message,
    this.status,
    this.localDateTime,
    this.body,
  });

  BicycleByCategoryModel copyWith({
    String? message,
    String? status,
    DateTime? localDateTime,
    List<bicycle>? body,
  }) {
    return BicycleByCategoryModel(
      message: message ?? this.message,
      status: status ?? this.status,
      localDateTime: localDateTime ?? this.localDateTime,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'status': status,
      'localDateTime': localDateTime?.millisecondsSinceEpoch,
      'body': body?.map((x) => x.toJson()).toList(),
    };
  }

  factory BicycleByCategoryModel.fromMap(Map<String, dynamic> map) {
    return BicycleByCategoryModel(
      message: map['message'] != null ? map['message'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      localDateTime: map['localDateTime'] != null
          ? DateTime.parse(map['localDateTime'])
          : null,
      body: map['body'] != null
          ? List<bicycle>.from(
              (map['body'] as List<dynamic>).map(
                (x) => bicycle.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  // factory BicycleByCategoryModel.fromMap(Map<String, dynamic> map) {
  //   return BicycleByCategoryModel(
  //     message: map['message'] != null ? map['message'] as String : null,
  //     status: map['status'] != null ? map['status'] as String : null,
  //     localDateTime: map['localDateTime'] != null
  //         ? DateTime.fromMillisecondsSinceEpoch(map['localDateTime'] as int)
  //         : null,
  //     body: map['body'] != null
  //         ? List<bicycle>.from(
  //             (map['body'] as List<int>).map<bicycle?>(
  //               (x) => bicycle.fromJson(x as Map<String, dynamic>),
  //             ),
  //           )
  //         : null,
  //   );
  // }

  String toJson() => json.encode(toMap());

  factory BicycleByCategoryModel.fromJson(String source) =>
      BicycleByCategoryModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BicycleByCategoryModel(message: $message, status: $status, localDateTime: $localDateTime, body: $body)';
  }

  @override
  bool operator ==(covariant BicycleByCategoryModel other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.status == status &&
        other.localDateTime == localDateTime &&
        listEquals(other.body, body);
  }

  @override
  int get hashCode {
    return message.hashCode ^
        status.hashCode ^
        localDateTime.hashCode ^
        body.hashCode;
  }
}

class bicycle {
  int? id;
  ModelPrice? modelPrice;
  int? size;
  String? photoPath;
  String? type;
  String? note = "";
  List<dynamic>? maintenance = [];
  bicycle({
    this.id,
    this.modelPrice,
    this.size,
    this.photoPath,
    this.type,
    this.note,
    this.maintenance,
  });

  factory bicycle.fromJson(Map<String, dynamic> json) => bicycle(
        id: json["id"] ?? 0,
        modelPrice: ModelPrice.fromJson(json["model_price"]),
        size: json["size"] ?? 0,
        photoPath: json["photoPath"] ?? '',
        type: json["type"] ?? '',
        note: json["note"] ?? '',
        maintenance: List<dynamic>.from(json["maintenance"] ?? []),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "model_price": modelPrice?.toJson(),
        "size": size,
        "photoPath": photoPath,
        "type": type,
        "note": note,
        "maintenance": List<dynamic>.from(maintenance!.map((x) => x)),
      };
}

// class ModelPrice {
//   int? id;
//   double? price = 8.0;
//   String? model = "dsfg";

//   ModelPrice({
//     this.id,
//     this.price,
//     this.model,
//   });

//   ModelPrice copyWith({
//     int? id,
//     double? price,
//     String? model,
//   }) {
//     return ModelPrice(
//       id: id ?? this.id,
//       price: price ?? this.price,
//       model: model ?? this.model,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'id': id,
//       'price': price,
//       'model': model,
//     };
//   }

//   factory ModelPrice.fromMap(Map<String, dynamic> map) {
//     return ModelPrice(
//       id: map['id'] != null ? map['id'] as int : null,
//       price: map['price'] != null ? map['price'] as double : null,
//       model: map['model'] != null ? map['model'] as String : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory ModelPrice.fromJson(String source) =>
//       ModelPrice.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'ModelPrice(id: $id, price: $price, model: $model)';

//   @override
//   bool operator ==(covariant ModelPrice other) {
//     if (identical(this, other)) return true;

//     return other.id == id && other.price == price && other.model == model;
//   }

//   @override
//   int get hashCode => id.hashCode ^ price.hashCode ^ model.hashCode;
// }

class ModelPrice {
  int? id;
  double? price;
  String? model;

  ModelPrice({
    this.id,
    this.price,
    this.model,
  });

  factory ModelPrice.fromJson(Map<String, dynamic> json) => ModelPrice(
        id: json["id"] ?? 0,
        price: (json["price"] ?? 0).toDouble(),
        model: json["model"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "model": model,
      };
}































//  import 'package:ride_project/core/config/handling_model.dart';

// class BicycleByCategoryModel extends ResultModel {
//   String? message="";
//   String? status="";
//   DateTime? localDateTime;
//   List<Bicycle>? body;

//   BicycleByCategoryModel({
//     this.message,
//     this.status,
//     this.localDateTime,
//     this.body,
//   });

//   factory BicycleByCategoryModel.fromJson(Map<String, dynamic> json) =>
//       BicycleByCategoryModel(
//         message: json["message"] ?? '',
//         status: json["status"] ?? '',
//         localDateTime: DateTime.parse(json["localDateTime"]),
//         body: List<Bicycle>.from(json["body"].map((x) => Bicycle.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "message": message,
//         "status": status,
//         "localDateTime": localDateTime?.toIso8601String(),
//         "body": List<dynamic>.from(body!.map((x) => x.toJson())),
//       };
// }

// class Bicycle {
//   int? id=1;
//   ModelPrice? modelPrice;
//   int? size=8;
//   String? photoPath="dfgh";
//   String? type="";
//   String? note="";
//   List<dynamic>? maintenance=[];

//   Bicycle({
//     this.id,
//     this.modelPrice,
//     this.size,
//     this.photoPath,
//     this.type,
//     this.note,
//     this.maintenance,
//   });

//   factory Bicycle.fromJson(Map<String, dynamic> json) => Bicycle(
//         id: json["id"] ?? 0,
//         modelPrice: ModelPrice.fromJson(json["model_price"]),
//         size: json["size"] ?? 0,
//         photoPath: json["photoPath"] ?? '',
//         type: json["type"] ?? '',
//         note: json["note"] ?? '',
//         maintenance: List<dynamic>.from(json["maintenance"] ?? []),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "model_price": modelPrice?.toJson(),
//         "size": size,
//         "photoPath": photoPath,
//         "type": type,
//         "note": note,
//         "maintenance": List<dynamic>.from(maintenance!.map((x) => x)),
//       };
// }

// class ModelPrice {
//   int? id=1;
//   double? price=8.2;
//   String? model="";

//   ModelPrice({
//     this.id,
//     this.price,
//     this.model,
//   });

//   factory ModelPrice.fromJson(Map<String, dynamic> json) => ModelPrice(
//         id: json["id"] ?? 0,
//         price: (json["price"] ?? 0).toDouble(),
//         model: json["model"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "price": price,
//         "model": model,
//       };
// }
