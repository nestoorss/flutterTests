import 'dart:convert';

import 'package:chat_app/global/environment.dart';
import 'package:chat_app/models/login_response.dart';
import 'package:chat_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService with ChangeNotifier {

  late Usuario usuario;
  bool _autenticando = false;

  // Create storage
  final _storage = FlutterSecureStorage();

  bool get autenticando => this._autenticando;
  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  // Getters del token de forma estatica
  static Future<String> getToken() async {
    final _storage = FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token ?? "";
  }

  static Future<void> deleteToken() async {
    final _storage = FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  Future<bool> login( String email, String password) async {

    bool res = false;
    this.autenticando = true;

    final data = {
      'email': email,
      'password': password
    };

    final uri = Uri.parse('${Environment.apiUrl}/login');

    final resp = await http.post(uri,
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(resp.body);
      this.usuario = loginResponse.usuario;

      await this._guardarToken(loginResponse.token);

      res = true;
    }
    
    this.autenticando = false;
    return res;

  }

  Future<bool> isLoggedIn() async {
    final token = await this._storage.read(key: 'token');
    final uri = Uri.parse('${Environment.apiUrl}/login/renew');

    final resp = await http.get(uri,
      headers: {
        'Content-Type': 'application/json',
        'x-token': token ?? ""
      }
    );

    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(resp.body);
      this.usuario = loginResponse.usuario;
      await this._guardarToken(loginResponse.token);

      return true;
    } else {
      this.logout();
      return false;
    }
  }

  Future register(String nombre, String email, String password) async {
    this.autenticando = true;

    final data = {
      'nombre': nombre,
      'email': email,
      'password': password
    };

    final uri = Uri.parse('${Environment.apiUrl}/login/new');

    final resp = await http.post(uri,
      body: jsonEncode(data),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    if (resp.statusCode == 200) {
      final loginResponse = LoginResponse.fromJson(resp.body);
      this.usuario = loginResponse.usuario;

      await this._guardarToken(loginResponse.token);
      return true;
    } else {
      final respBody = jsonDecode(resp.body);
      return respBody['msg'];
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    await _storage.delete(key: 'token');
  }

}