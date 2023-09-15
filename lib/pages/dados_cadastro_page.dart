import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Meus dados"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextLabel(texto: "Nome"),
                TextField(
                  controller: nomeController,
                ),
                const SizedBox(
                  height: 10,
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
                TextButton(
                    onPressed: () {
                      debugPrint(nomeController.text);
                    },
                    child: const Text("Salvar"))
              ],
            ),
          )),
    );
  }
}
