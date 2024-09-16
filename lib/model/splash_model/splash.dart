import 'dart:convert';

Splash splashFromJson(String str) => Splash.fromJson(json.decode(str));

String splashToJson(Splash data) => json.encode(data.toJson());

class Splash {
  String deviceType;
  String deviceId;
  String deviceName;
  String deviceOsVersion;
  String deviceIpAddress;
  double lat;
  double long;
  String buyerGcmid;
  String buyerPemid;
  App app;

  Splash({
    required this.deviceType,
    required this.deviceId,
    required this.deviceName,
    required this.deviceOsVersion,
    required this.deviceIpAddress,
    required this.lat,
    required this.long,
    required this.buyerGcmid,
    required this.buyerPemid,
    required this.app,
  });

  factory Splash.fromJson(Map<String, dynamic> json) => Splash(
        deviceType: json["deviceType"] ?? '',
        deviceId: json["deviceId"] ?? '',
        deviceName: json["deviceName"] ?? '',
        deviceOsVersion: json["deviceOSVersion"] ?? '',
        deviceIpAddress: json["deviceIPAddress"] ?? '',
        lat: (json["lat"] ?? 0.0).toDouble(),
        long: (json["long"] ?? 0.0).toDouble(),
        buyerGcmid: json["buyer_gcmid"] ?? '',
        buyerPemid: json["buyer_pemid"] ?? '',
        app: App.fromJson(json["app"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "deviceType": deviceType,
        "deviceId": deviceId,
        "deviceName": deviceName,
        "deviceOSVersion": deviceOsVersion,
        "deviceIPAddress": deviceIpAddress,
        "lat": lat,
        "long": long,
        "buyer_gcmid": buyerGcmid,
        "buyer_pemid": buyerPemid,
        "app": app.toJson(),
      };
}

class App {
  String version;
  DateTime installTimeStamp;
  DateTime uninstallTimeStamp;
  DateTime downloadTimeStamp;

  App({
    required this.version,
    required this.installTimeStamp,
    required this.uninstallTimeStamp,
    required this.downloadTimeStamp,
  });

  factory App.fromJson(Map<String, dynamic> json) => App(
        version: json["version"] ?? '',
        installTimeStamp:
            DateTime.tryParse(json["installTimeStamp"] ?? '') ?? DateTime.now(),
        uninstallTimeStamp:
            DateTime.tryParse(json["uninstallTimeStamp"] ?? '') ??
                DateTime.now(),
        downloadTimeStamp: DateTime.tryParse(json["downloadTimeStamp"] ?? '') ??
            DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "installTimeStamp": installTimeStamp.toIso8601String(),
        "uninstallTimeStamp": uninstallTimeStamp.toIso8601String(),
        "downloadTimeStamp": downloadTimeStamp.toIso8601String(),
      };
}
