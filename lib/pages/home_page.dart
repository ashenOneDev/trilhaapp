import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:trilhaap/service/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var generatedNumber = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu App",
          style: GoogleFonts.pacifico(),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
            child: Text(
          "Foi cliado $quantidadeCliques vezes",
          style: GoogleFonts.acme(fontSize: 20),
        )),
        Center(
            child: Text(
          "O número gerado foi: $generatedNumber",
          style: GoogleFonts.acme(fontSize: 20),
        ))
      ]),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            generatedNumber =
                GeradorNumeroAleatorioService.generateRandomNumber(1000);
            quantidadeCliques++;
          });
        },
      ),
    );
  }
}
