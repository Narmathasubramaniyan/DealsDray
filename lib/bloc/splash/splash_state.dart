import 'package:dealsdray/model/splash_model/splash.dart';
import 'package:equatable/equatable.dart';

class SplashState extends Equatable {
  final List<Splash> splash;
  final String? errorMessage; // Optional error message

  const SplashState({this.splash = const [], this.errorMessage});

  @override
  List<Object?> get props => [splash, errorMessage];
}
