import 'package:trilhaap/model/tarefas_back4app_model.dart';

import 'back4app_custom_dio.dart';

class TarefasBack4appRepository {
  final _customDio = Back4appCustomDio();

  TarefasBack4appRepository();

  Future<TarefasBack4appModel> obterTarefas(bool naoConcluidas) async {
    var url = "/Tarefas";
    if (naoConcluidas) {
      url = "$url?where={\"concluido\":false}";
    }
    var response = await _customDio.dio.get(url);

    return TarefasBack4appModel.fromJson(response.data);
  }

  Future<void> criarTarefa(TarefaBack4appModel tarefaBack4appModel) async {
    try {
      await _customDio.dio
          .post("/Tarefas", data: tarefaBack4appModel.toCreateJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> atualizarTarefa(TarefaBack4appModel tarefaBack4appModel) async {
    try {
      await _customDio.dio.put("/Tarefas/${tarefaBack4appModel.objectId}",
          data: tarefaBack4appModel.toCreateJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removerTarefa(String objectId) async {
    try {
      await _customDio.dio.delete("/Tarefas/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
