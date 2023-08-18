import 'package:flutter/material.dart';
import 'package:imc_calculator_hive/model/imc_model.dart';
import 'package:imc_calculator_hive/repository/imc_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nomeController = TextEditingController(text: "");
  var pesoController = TextEditingController();
  var alturaController = TextEditingController();

  late ImcRepository imcRepository;
  var _imcModel = const <ImcModel>[];

  @override
  void initState() {
    super.initState();
    obterImc();
  }

  void obterImc() async {
    imcRepository = await ImcRepository.carregar();
    _imcModel = imcRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3918A9),
        title: const Text(
          'Calculadora de IMC',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3918A9),
        onPressed: () {
          nomeController.text = '';
          pesoController.text = '';
          alturaController.text = '';

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  alignment: Alignment.center,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  title: const Text(
                    "Novo cálculo:",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: nomeController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 0.0),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFBD1B69))),
                          labelText: 'Informe seu nome',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          hintText: "Fulano",
                          hintStyle: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 14,
                          ),
                        ),
                        cursorColor: const Color(0xFF3918A9),
                      ),
                      TextField(
                        controller: pesoController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 0.0),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFBD1B69))),
                          labelText: 'Informe seu peso',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          hintText: "60.0",
                          hintStyle: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 14,
                          ),
                        ),
                        cursorColor: const Color(0xFF3918A9),
                      ),
                      TextField(
                        controller: alturaController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 0.0),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFBD1B69))),
                          labelText: 'Informe sua altura',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          hintText: "175.0",
                          hintStyle: TextStyle(
                            color: Color(0xFF272727),
                            fontSize: 14,
                          ),
                        ),
                        cursorColor: const Color(0xFF3918A9),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancelar",
                          style:
                              TextStyle(color: Color(0xFF272727), fontSize: 18),
                        )),
                    TextButton(
                        onPressed: () async {
                          double peso = double.parse(pesoController.text);
                          double altura = double.parse(alturaController.text);

                          await imcRepository.salvar(ImcModel.criar(
                              nomeController.text, peso, altura));
                          if (mounted) {
                            Navigator.pop(context);
                          }
                          obterImc();
                          setState(() {});
                        },
                        child: const Text(
                          "Calcular",
                          style:
                              TextStyle(color: Color(0xFF3918A9), fontSize: 18),
                        )),
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _imcModel.length,
                itemBuilder: (BuildContext context, int index) {
                  var imc = _imcModel[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Card(
                      elevation: 8.0,
                      child: ListTile(
                        title: Text(
                          'Nome: ${imc.nome}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Peso: ${imc.peso.toString()}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Altura: ${imc.altura.toString()}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'Resultado: ${imc.calcularImc()} - ${imc.classificarImc()}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () {
                            imcRepository.excluir(imc);
                            obterImc();
                          },
                          child: const Icon(
                            Icons.delete,
                            color: Color(0xFFBD1B69),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
