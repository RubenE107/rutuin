abstract class IAuthRepository {
  Future<String?> login(String email, String password);
  Future<bool> register(String email, String password, String name);
  Future <Map<String, dynamic>?> getUserData(String userId);
  //Future<bool> logout();
}
