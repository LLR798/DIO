import 'package:flutter/material.dart';

class Imc {
  final String _id = UniqueKey().toString();
  String _nome;
  double _peso;
  double _altura;

  Imc(this._nome, this._peso, this._altura);

  String get id => _id;

  String get nome => _nome;

  double get peso => _peso;

  double get altura => _altura;

  set nome(String nome) {
    _nome = nome;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  double calcularImc() {
    double imc = _peso / (_altura * _altura);
    return double.parse(imc.toStringAsFixed(2));
  }

  String classificarImc() {
    final imc = calcularImc();
    if (imc < 16) {
      return 'Magreza Grave';
    } else if (imc < 17) {
      return 'Magreza Moderada';
    } else if (imc < 18.5) {
      return 'Magreza Leve';
    } else if (imc < 25) {
      return 'Saudável';
    } else if (imc < 30) {
      return 'Sobrepeso';
    } else if (imc < 35) {
      return 'Obesidade Grau I';
    } else if (imc < 40) {
      return 'Obesidade Grau II (Severa)';
    } else {
      return 'Obesidade Grau III (Mórbida)';
    }
  }
}
