import 'package:flutter/material.dart';

import '../model/viacep_model.dart';
import '../repositories/via_cep/impl/via_cep_dio_repository.dart';
import '../repositories/via_cep/via_cep_repository.dart';

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({Key? key}) : super(key: key);

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viacepModel = ViaCEPModel();
  ViaCepRepository viaCEPRepository = ViaCepDioRepository();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text(
              "Consulta de CEP",
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              //maxLength: 8,
              onChanged: (String value) async {
                var cep = value.replaceAll(new RegExp(r'[^0-9]'), '');
                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  viacepModel = await viaCEPRepository.consultarCEP(cep);
                }
                setState(() {
                  loading = false;
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              viacepModel.logradouro ?? "",
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
              style: const TextStyle(fontSize: 18),
            ),
            if (loading) const CircularProgressIndicator()
          ],
        ),
      ),
    ));
  }
}
