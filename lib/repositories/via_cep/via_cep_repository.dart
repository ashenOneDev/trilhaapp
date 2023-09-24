import '../../model/viacep_model.dart';

abstract class ViaCepRepository {
  Future<ViaCEPModel> consultarCEP(String cep);
}
