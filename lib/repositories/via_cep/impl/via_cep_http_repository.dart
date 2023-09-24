import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trilhaap/repositories/via_cep/via_cep_repository.dart';

import '../../../model/viacep_model.dart';

class ViaCepHttpRepository implements ViaCepRepository {
  @override
  Future<ViaCEPModel> consultarCEP(String cep) async {
    String url = "https://viacep.com.br/ws/$cep/json/";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ViaCEPModel.fromJson(json);
    }
    return ViaCEPModel();
  }
}
