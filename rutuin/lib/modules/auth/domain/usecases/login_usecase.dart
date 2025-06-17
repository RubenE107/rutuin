import '../repositories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository repository;

  LoginUseCase(this.repository);

  Future<bool> execute(String email, String password) {
    return repository.login(email, password);
  }
  
}
