import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int? numeroGerado = 0;
  int? quantidadeCliques = 0;
  final CHAVE_NUMERO_ALEATORIO = "numero_aleatorio";
  final CHAVE_QUANTIDADE_CLIQUES = "quantidade_cliques";
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    prefs = await SharedPreferences.getInstance();
    prefs.getInt(CHAVE_NUMERO_ALEATORIO);
    setState(() {
      numeroGerado = prefs.getInt(CHAVE_NUMERO_ALEATORIO) ?? 0;
      quantidadeCliques = prefs.getInt(CHAVE_QUANTIDADE_CLIQUES) ?? 0;
    });
    debugPrint(numeroGerado.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gerador de números \naleatórios"),
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
                quantidadeCliques = (quantidadeCliques ?? 0) + 1;
              });
              prefs.setInt(CHAVE_NUMERO_ALEATORIO, numeroGerado!);
              prefs.setInt(CHAVE_QUANTIDADE_CLIQUES, quantidadeCliques!);
            }),
      ),
    );
  }
}
