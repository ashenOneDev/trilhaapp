import 'package:trilhaap/model/viacep_model.dart';
import 'package:trilhaap/repositories/via_cep/via_cep_repository.dart';

import 'package:dio/dio.dart';

class ViaCepDioRepository implements ViaCepRepository {
  @override
  Future<ViaCEPModel> consultarCEP(String cep) async {
    var dio = Dio();
    var response = await dio.get("https://viacep.com.br/ws/$cep/json/");
    if (response.statusCode == 200) {
      return ViaCEPModel.fromJson(response.data);
    } else {
      return ViaCEPModel();
    }
  }
}
