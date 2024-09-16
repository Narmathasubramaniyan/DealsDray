import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:dealsdray/repository/login/login_repo.dart';

class LoginImpl extends LoginRepo {
  final Dio _dio = Dio();
  final Logger _logger = Logger();

  @override
  Future<Map<String, String>> postMobileNumber(String phoneNumber) async {
    try {
      final response = await _dio.post(
        'http://devapiv4.dealsdray.com/api/v2/user/otp',
        data: {'phoneNumber': phoneNumber},
      );

      _logger.i('Backend response: ${response.data}'); // Log the response

      if (response.statusCode == 200) {
        final isRegistered = response.data['isRegistered'] ?? false;
        _logger.i('isRegistered: $isRegistered'); // Log registration status

        if (isRegistered) {
          return {
            'message': response.data['message'] ?? 'OTP sent',
            'customer_id': response.data['customer_id'] ?? '',
          };
        } else {
          // Handle unregistered phone number
          return {
            'message':
                'Phone number not registered. Please register via email.',
            'customer_id': '', // Empty or default value
          };
        }
      } else {
        // Handle other HTTP errors
        _logger.e(
            'Failed to send OTP. Server responded with status code ${response.statusCode}');
        throw Exception(
            'Failed to send OTP. Server responded with status code ${response.statusCode}');
      }
    } catch (e) {
      // Handle Dio exceptions and provide a user-friendly message
      _logger.e('Error sending OTP: $e');
      throw Exception('Failed to send OTP. Please try again later.');
    }
  }
}
