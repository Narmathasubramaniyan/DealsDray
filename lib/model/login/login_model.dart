// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  String mobileNumber;
  String deviceId;

  Login({
    required this.mobileNumber,
    required this.deviceId,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        mobileNumber: json["mobileNumber"],
        deviceId: json["deviceId"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "deviceId": deviceId,
      };
}
