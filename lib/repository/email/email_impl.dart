import 'package:dealsdray/repository/email/email_repo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EmailRepositoryImpl extends EmailRepository {
  final String _baseUrl =
      'http://devapiv4.dealsdray.com/api/v2/user/email/referral';

  @override
  Future<Map<String, String>> postEmailLogin(
      String email, String password, int referralCode) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'referralCode': referralCode,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return {
          'message': responseData['message'] ?? 'Login successful',
          'userId': responseData['userId'] ?? '',
        };
      } else if (response.statusCode == 409) {
        throw Exception(
            'Conflict: ${jsonDecode(response.body)['message'] ?? 'Request could not be processed.'}');
      } else {
        throw Exception('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
