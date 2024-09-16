import 'package:dealsdray/bloc/splash/splash_event.dart';
import 'package:dealsdray/bloc/splash/splash_state.dart';
import 'package:dealsdray/repository/splash/splash_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashImpl splashImpl;

  SplashBloc({required this.splashImpl}) : super(const SplashState()) {
    on<SplashInitial>(_onSplashInitial);
  }

  Future<void> _onSplashInitial(
      SplashInitial event, Emitter<SplashState> emit) async {
    emit(const SplashState(splash: [])); // Set initial loading state

    try {
      final splashData = await splashImpl.postSplashData({
        // Provide the actual device data map here
        'deviceType': 'exampleType',
        'deviceId': 'exampleId',
        'deviceName': 'exampleName',
        'deviceOSVersion': 'exampleOSVersion',
        'deviceIPAddress': 'exampleIPAddress',
        'lat': 0.0,
        'long': 0.0,
        'buyer_gcmid': 'exampleGcmid',
        'buyer_pemid': 'examplePemid',
        'app': {
          'version': '1.0',
          'installTimeStamp': DateTime.now().toIso8601String(),
          'uninstallTimeStamp': DateTime.now().toIso8601String(),
          'downloadTimeStamp': DateTime.now().toIso8601String(),
        }
      });
      emit(SplashState(splash: splashData)); // Emit success state
    } catch (e) {
      emit(SplashState(errorMessage: e.toString())); // Emit error state
    }
  }
}
