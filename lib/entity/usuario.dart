import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_splash_screen/entity/curso.dart';

class Usuario {
  String _nome;
  String _email;
  String _senha;
  String _urlImagemPerfil;
  bool _adm;
  int _pontuacaoTotal;
  bool _premium;

  Usuario(this._adm, this._email, this._nome, this._pontuacaoTotal, this._senha,
      this._urlImagemPerfil, this._premium);

  bool get premium => this._premium;

  set premium(bool value) => this._premium = value;

  bool get adm => _adm;

  set adm(bool value) {
    _adm = value;
  }

  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get senha => _senha;

  set senha(String value) {
    _senha = value;
  }

  String get urlImagemPerfil => _urlImagemPerfil;

  set urlImagemPerfil(String value) {
    _urlImagemPerfil = value;
  }

  int get pontuacaoTotal => _pontuacaoTotal;

  set pontuacaoTotal(int value) {
    _pontuacaoTotal = value;
  }
}
