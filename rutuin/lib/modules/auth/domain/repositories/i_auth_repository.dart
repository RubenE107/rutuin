abstract class IAuthRepository {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password, String name);
  //Future<bool> logout();
}
