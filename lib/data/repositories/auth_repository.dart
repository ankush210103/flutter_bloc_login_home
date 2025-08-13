class AuthRepository {
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    // Simulate success login if validation is passed
    return true;
  }
}
