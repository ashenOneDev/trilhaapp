import 'package:flutter/material.dart';
import 'package:trilhaap/repositories/linguagens_repository.dart';
import 'package:trilhaap/repositories/nivel_repository.dart';
import 'package:trilhaap/shared/widgets/text_label.dart';

class DadosCadastroPage extends StatefulWidget {
  const DadosCadastroPage({super.key});

  @override
  State<DadosCadastroPage> createState() => _DadosCadastroPageState();
}

class _DadosCadastroPageState extends State<DadosCadastroPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRespository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var nivelSelecionado = "";
  var linguagens = [];
  var linguagensSelecionadas = [];
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;
  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= quantidadeMaxima; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Meus dados"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: salvando
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      const TextLabel(texto: "Nome"),
                      TextField(
                        controller: nomeController,
                      ),
                      const TextLabel(texto: "Data de nascimento"),
                      TextField(
                        controller: dataNascimentoController,
                        readOnly: true,
                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2000, 1, 1),
                              firstDate: DateTime(1900, 5, 1),
                              lastDate: DateTime(2023, 10, 23));
                          if (date != null) {
                            dataNascimentoController.text = date.toString();
                            dataNascimento = date;
                          }
                        },
                      ),
                      const TextLabel(texto: "Nível de experiencia"),
                      Column(
                          children: niveis
                              .map((nivel) => RadioListTile(
                                  dense: true,
                                  title: Text(nivel.toString()),
                                  selected: nivelSelecionado == nivel,
                                  value: nivel,
                                  groupValue: nivelSelecionado,
                                  onChanged: (value) {
                                    setState(() {
                                      nivelSelecionado = value;
                                    });
                                  }))
                              .toList()),
                      const TextLabel(texto: "Linguagens preferidas"),
                      Column(
                        children: linguagens
                            .map((linguagem) => CheckboxListTile(
                                dense: true,
                                title: Text(linguagem),
                                value:
                                    linguagensSelecionadas.contains(linguagem),
                                onChanged: (value) {
                                  setState(() {
                                    if (value == true) {
                                      linguagensSelecionadas.add(linguagem);
                                    } else {
                                      linguagensSelecionadas.remove(linguagem);
                                    }
                                  });
                                }))
                            .toList(),
                      ),
                      const TextLabel(texto: "Tempo de experiência"),
                      DropdownButton(
                          isExpanded: true,
                          value: tempoExperiencia,
                          items: returnItens(50),
                          onChanged: (value) {
                            setState(() {
                              tempoExperiencia = int.parse(value.toString());
                            });
                          }),
                      TextLabel(
                          texto:
                              "Pretenção salarial. R\$ ${salarioEscolhido.round()}"),
                      Slider(
                          min: 0,
                          max: 10000,
                          value: salarioEscolhido,
                          onChanged: (double value) {
                            setState(() {
                              salarioEscolhido = value;
                            });
                          }),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              salvando = false;
                            });
                            if (nomeController.text.trim().length < 3) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("O nome deve ser preenchido")));
                              return;
                            }
                            if (dataNascimento == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Data de nascimento inválida")));
                              return;
                            }
                            if (nivelSelecionado.trim() == "") {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "O nível deve ser selecionado")));
                              return;
                            }
                            if (linguagensSelecionadas.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Deve ser selecionado ao menos uma linguagem")));
                              return;
                            }
                            if (tempoExperiencia == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Deve ter ao menos um ano de experiência")));
                              return;
                            }
                            if (salarioEscolhido == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "A pretenção salarial deve ser maior que zero")));
                              return;
                            }

                            /* debugPrint(nomeController.text);
                      debugPrint(dataNascimento.toString());
                      debugPrint(nivelSelecionado);
                      debugPrint(linguagensSelecionadas.toString());
                      debugPrint(tempoExperiencia.toString());
                      debugPrint(salarioEscolhido.round().toString()); */

                            setState(() {
                              salvando = true;
                            });
                            Future.delayed(const Duration(seconds: 3), () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Dados salvo com sucesso")));
                              setState(() {
                                salvando = false;
                              });
                              Navigator.pop(context);
                            });
                          },
                          child: const Text("Salvar"))
                    ],
                  ),
          )),
    );
  }
}
