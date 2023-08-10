import 'package:imc_calculator/models/imc_calculator.dart';

void execute() {
  IMCCalculator calculator = IMCCalculator('', 0.0, 0.0);

  String name = calculator.getName();
  double weight = calculator.getWeight();
  double height = calculator.getHeight();


  double result = calculator.imcCalculate(weight: weight, height: height);

  print('\n');
  print('=== Resultado ===');
  print('Nome: $name.');
  print('Resultado: $result.');

  if (result < 16) {
    print("Magreza grave");
  } else if (result < 17) {
    print("Magreza moderada");
  } else if (result < 18.5) {
    print("Magreza leve");
  } else if (result < 25) {
    print("Saudável");
  } else if (result < 30) {
    print("Sobrepeso");
  } else if (result < 35) {
    print("Obesidade grau I");
  } else if (result < 40) {
    print("Obesidade grau II - severa");
  } else {
    print("Obesidade grau III - mórbida");
  }
}

