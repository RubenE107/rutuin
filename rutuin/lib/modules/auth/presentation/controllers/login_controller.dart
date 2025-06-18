// import '../../../domain/usecases/login_usecase.dart';
// import '../../../data/repositories/auth_repository_impl.dart';
import 'package:rutuin/modules/auth/data/models/usuario_models.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../data/repositories/auth_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../auth/presentation/providers/user_provider.dart';

class LoginController {
  late final LoginUseCase _loginUseCase;
  late final RegisterUseCase _registerUseCase;

  LoginController() {
    final repo = AuthRepositoryImpl(); // esto luego se puede inyectar
    _loginUseCase = LoginUseCase(repo);
    _registerUseCase = RegisterUseCase(repo);
  }

  Future<bool> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    final String? result = await _loginUseCase.execute(email, password);

    if (result == null) return false;
    final data = await _loginUseCase.getUserData(result);
    if (data == null) return false;
    //if (!context.mounted) return false; // Solo si llamas desde un StatefulWidget
    final usuario = UsuarioModel.fromJson(data);
    Provider.of<UserProvider>(context, listen: false).setUsuario(usuario);
    return true;
  }

  Future<bool> register(String email, String password, String name) async {
    return await _registerUseCase.register(email, password, name);
  }
}
