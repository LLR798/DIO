import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:imc_calculator_hive/model/imc_model.dart';
import 'package:imc_calculator_hive/my_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var documentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(ImcModelAdapter());
  runApp(const MyApp());
}
