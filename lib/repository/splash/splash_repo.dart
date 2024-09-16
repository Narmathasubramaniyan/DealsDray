import 'package:dealsdray/model/splash_model/splash.dart';

abstract class SplashRepo {
  Future<List<Splash>> postSplashData(Map<String, dynamic> deviceData);
}
