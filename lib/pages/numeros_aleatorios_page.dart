import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int numeroGerado = 0;
  int quantidadeCliques = 0;
  late Box boxNumerosAleatorios;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen("box_numeros_aleatorios")) {
      boxNumerosAleatorios = Hive.box("box_numeros_aleatorios");
    } else {
      boxNumerosAleatorios = await Hive.openBox("box_numeros_aleatorios");
    }

    numeroGerado = boxNumerosAleatorios.get("numeroGerado") ?? 0;
    quantidadeCliques = boxNumerosAleatorios.get("quantidadeCliques") ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gerador de números \naleatórios Hive"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado.toString(),
                style: const TextStyle(fontSize: 22),
              ),
              Text(
                quantidadeCliques.toString(),
                style: const TextStyle(fontSize: 22),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              var random = Random();

              setState(() {
                numeroGerado = random.nextInt(1000);
                quantidadeCliques = (quantidadeCliques) + 1;
              });
              boxNumerosAleatorios.put("numeroGerado", numeroGerado);
              boxNumerosAleatorios.put("quantidadeCliques", quantidadeCliques);
            }),
      ),
    );
  }
}
