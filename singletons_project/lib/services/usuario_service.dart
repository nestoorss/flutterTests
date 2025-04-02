import 'package:flutter/material.dart';
import 'package:singletons_project/models/usuario.dart';

class UsuarioService with ChangeNotifier {

  Usuario? _usuario;

  Usuario get usuario => this._usuario!;
  bool get existeUsuario => this._usuario != null ? true : false;

  set usuario(Usuario user) {
    this._usuario = user;
    notifyListeners();
  }

  void cambiarEdad( int edad) {
    if (this._usuario != null) {
      this._usuario!.edad = edad;
      notifyListeners();
    }
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    if (this._usuario != null) {
      this._usuario!.profesiones.add('Profesion ${this.usuario.profesiones.length + 1}');
      notifyListeners();
    }
  }

}