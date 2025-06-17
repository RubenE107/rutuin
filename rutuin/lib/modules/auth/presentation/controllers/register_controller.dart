import '../../domain/usecases/register_usecase.dart';

class RegisterController {
  final RegisterUseCase _useCase;

  RegisterController(this._useCase);

  Future<String> validateAndRegister(String email, String pass,String name,String confirm) async {
    if (email.isEmpty || pass.isEmpty || confirm.isEmpty) {
      return 'Todos los campos son obligatorios';
    }

    if (pass != confirm) {
      return 'Las contraseñas no coinciden';
    }
  final result = await _useCase.register(email, pass, name);
  if (result) {
    return 'Registro exitoso';
  }
  else {
    return 'Error al registrar, intente nuevamente';
  }
  }
}
