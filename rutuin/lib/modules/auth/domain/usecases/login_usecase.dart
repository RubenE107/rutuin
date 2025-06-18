import '../repositories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  Future<String?> execute(String email, String password) {
    return repository.login(email, password);
  }
  Future<Map<String, dynamic>?> getUserData(String userId) {
    return repository.getUserData(userId);
  }
  
}
