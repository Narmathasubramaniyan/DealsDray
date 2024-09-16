import 'package:dealsdray/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:dealsdray/repository/splash/splash_impl.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashImpl _splashRepo = SplashImpl();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _collectDeviceData();
  }

  Future<void> _collectDeviceData() async {
    // Replace with actual device data collection if needed
    final deviceData = {
      'deviceType': 'android', // Example values
      'deviceId': 'C6179909526098',
      'deviceName': 'Samsung-MT200',
      'deviceOSVersion': '2.3.6',
      'deviceIPAddress': '11.433.445.66',
      'lat': 9.9312,
      'long': 76.2673,
      'buyer_gcmid': '', // Example values
      'buyer_pemid': '',
      'app': {
        'version': '1.20.5',
        'installTimeStamp': '2022-02-10T12:33:30.696Z',
        'uninstallTimeStamp': '2022-02-10T12:33:30.696Z',
        'downloadTimeStamp': '2022-02-10T12:33:30.696Z',
      },
    };

    await _postDeviceData(deviceData);
  }

  Future<void> _postDeviceData(Map<String, dynamic> deviceData) async {
    try {
      await _splashRepo.postSplashData(deviceData);
      await Future.delayed(const Duration(seconds: 5));
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          _errorMessage = 'Failed to post device data: $error';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _errorMessage == null
            ? Image.asset(
                'assets/splash.png',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              )
            : Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 18),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
