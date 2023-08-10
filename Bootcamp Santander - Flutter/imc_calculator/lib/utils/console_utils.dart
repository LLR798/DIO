import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String readStringText(String text) {
    print(text);
    return readString();
  }

  static String readString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static double readDouble(String text) {
    String input = readStringText(text);
    if (input.isEmpty) {
      return 0.0;
    } else {
      return double.tryParse(input) ?? 0.0;
    }
  }
}
