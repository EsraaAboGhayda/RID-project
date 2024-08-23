class SingUpModel {
  String? firstName;
  String? lastName;
  String? phone;
  String? username;
  DateTime? birthDate;
  String? password;
  String? confirmPassword;

  SingUpModel({
    this.firstName,
    this.lastName,
    this.phone,
    this.username,
    this.birthDate,
    this.password,
    this.confirmPassword,
  });

  factory SingUpModel.fromJson(Map<String, dynamic> json) => SingUpModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        username: json["username"],
        birthDate: DateTime.parse(json["birthDate"]),
        password: json["password"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "username": username,
        "birthDate":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "password": password,
        "confirmPassword": confirmPassword,
      };
}
