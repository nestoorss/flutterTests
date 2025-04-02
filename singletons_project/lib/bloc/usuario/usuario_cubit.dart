import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singletons_project/models/usuario.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {

  UsuarioCubit(): super(UsuarioInitial());

  void seleccionarUsuario(Usuario user) {
    emit(UsuarioActivo(user));
  }

  void cambiarEdad(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.usuario.copiarUsuario(edad: 19);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion() {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final oldUser = currentState.usuario.copiarUsuario();
      oldUser.profesiones.add("Profesion ${oldUser.profesiones.length + 1}");
      emit(UsuarioActivo(oldUser));
    }
  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }

}