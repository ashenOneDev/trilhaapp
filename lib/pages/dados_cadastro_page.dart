import 'package:flutter/material.dart';

class DadosCadastroPage extends StatelessWidget {
  final String texto;
  final List<String> dados;
  const DadosCadastroPage(
      {super.key, required this.texto, required this.dados});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(texto),
        ),
        body: Center(
          child: Text(dados.length.toString()),
        ),
      ),
    );
  }
}
