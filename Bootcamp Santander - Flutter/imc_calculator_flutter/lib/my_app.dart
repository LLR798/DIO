import 'package:flutter/material.dart';
import 'package:imc_calculator_flutter/pages/home_page.dart';
import 'package:imc_calculator_flutter/pages/splash_screen_page.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora IMC',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: '/splashPage',
      routes: {
        '/splashPage': (context) => const SplashScreenPage(),
        '/homePage': (context) => const HomePage(),
      },
    );
  }
}