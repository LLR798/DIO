import 'package:imc_calculator/models/abstract_person.dart';
import 'package:imc_calculator/utils/console_utils.dart';

class IMCCalculator extends Person {
  IMCCalculator(String name, double weight, double height)
      : super(name, weight, height);

  @override
  String getName() {
    print('=== Bem-vindo a calculadora de IMC: ===');
    String name = ConsoleUtils.readStringText('Digite seu nome');
    if (name == '') {
      return 'Anônimo';
    } else {
      return name;
    }
  }

  @override
  double getWeight() {
    double weightString = ConsoleUtils.readDouble('Digite o seu peso');
    if (weightString <= 0) {
      throw ArgumentError('O valor do peso tem que ser maior que zero!');
    }
    return weightString;
  }

  @override
  double getHeight() {
    double heightString = ConsoleUtils.readDouble('Digite a sua altura');
    if (heightString <= 0) {
      throw ArgumentError('O valor da altura tem que ser maior que zero!');
    }
    return heightString;
  }

  double imcCalculate({required double weight, required double height}) {
    return weight / (height * height);
  }
}
