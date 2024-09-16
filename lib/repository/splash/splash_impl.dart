import 'package:dio/dio.dart';
import 'package:logger/logger.dart'; // Import logger
import 'package:dealsdray/model/splash_model/splash.dart';
import 'package:dealsdray/repository/splash/splash_repo.dart';

class SplashImpl extends SplashRepo {
  final Dio _dio = Dio(); // Create a Dio instance
  final Logger _logger = Logger(); // Create a Logger instance

  @override
  Future<List<Splash>> postSplashData(Map<String, dynamic> deviceData) async {
    try {
      _logger.i('Posting device data: $deviceData'); // Log info

      final response = await _dio.post(
        "http://devapiv4.dealsdray.com/api/v2/user/device/add",
        data: deviceData, // Send the data as a JSON object
        options: Options(
          contentType: Headers.jsonContentType, // Set content type to JSON
        ),
      );

      _logger.i('Response status: ${response.statusCode}');
      _logger.i('Response body: ${response.data}');

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is List) {
          return responseData
              .map((json) => Splash.fromJson(json as Map<String, dynamic>))
              .toList();
        } else if (responseData is Map<String, dynamic>) {
          // Handle case where response is a single object instead of a list
          return [Splash.fromJson(responseData)];
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to post splash data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      _logger.e('Error posting splash data: $error'); // Log error
      throw Exception('Error posting splash data: $error');
    }
  }
}
