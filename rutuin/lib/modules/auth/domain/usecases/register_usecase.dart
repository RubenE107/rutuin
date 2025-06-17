import '../repositories/i_auth_repository.dart';

class RegisterUseCase {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  Future<bool> register(String email, String password, String name) {
    return repository.register(email, password, name);
  }
}
