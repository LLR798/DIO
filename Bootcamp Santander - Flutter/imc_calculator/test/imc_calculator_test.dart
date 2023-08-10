import 'package:test/test.dart';
import 'package:imc_calculator/models/imc_calculator.dart';

void main() {
  group('IMC Calculator Tests', () {
    test('Teste de cálculo do IMC válido', () {
      IMCCalculator calculator = IMCCalculator('Marcelo', 76.0, 1.77);
      double result = calculator.imcCalculate(
          weight: calculator.getWeight(), height: calculator.getHeight());
      expect(result, closeTo(24.25, 0.01));
    });

    test('Teste de cálculo do IMC com altura inválida (zero)', () {
      IMCCalculator calculator = IMCCalculator('Marcelo', 60.0, 0.0);

      expect(
          () => calculator.imcCalculate(
              weight: calculator.getWeight(), height: calculator.getHeight()),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Teste de cálculo do IMC com peso inválido (zero)', () {
      IMCCalculator calculator = IMCCalculator('Marcelo', 0.0, 1.90);

      expect(
          () => calculator.imcCalculate(
              weight: calculator.getWeight(), height: calculator.getHeight()),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('Teste de entrada do nome vazio', () {
      IMCCalculator calculator = IMCCalculator('', 60.0, 1.70);
      String name = calculator.getName();

      expect(name, equals('Anônimo'));
    });
  });
}
