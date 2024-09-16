abstract class EmailRepository {
  Future<Map<String, String>> postEmailLogin(
      String email, String password, int referralCode);
}
