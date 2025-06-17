// import '../../../domain/usecases/login_usecase.dart';
// import '../../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
class LoginController {
  late final LoginUseCase _loginUseCase;
  late final RegisterUseCase _registerUseCase;

  LoginController() {
    final repo = AuthRepositoryImpl(); // esto luego se puede inyectar
    _loginUseCase = LoginUseCase(repo);
    _registerUseCase = RegisterUseCase(repo);
  }

  Future<bool> login(String email, String password) async {
    return await _loginUseCase.execute(email, password);
  }
  Future<bool> register(String email, String password, String name) async {
    return await _registerUseCase.register(email, password, name);
  }
}
