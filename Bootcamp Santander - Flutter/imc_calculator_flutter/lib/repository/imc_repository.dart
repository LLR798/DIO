import 'package:imc_calculator_flutter/model/imc.dart';

class ImcRepository {
  final List<Imc> _resultadoImc = [];

  Future<void> adicionar(Imc resultadoImc) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _resultadoImc.add(resultadoImc);
  }

  Future<void> remover(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _resultadoImc.remove(_resultadoImc.where((imc) => imc.id == id).first);
    // Testar o removeWhere
  }

  Future<List<Imc>> listarResultadosImc() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _resultadoImc;
  }
}
