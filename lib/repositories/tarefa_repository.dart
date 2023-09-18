import 'package:trilhaap/model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> adicionarTarefa(Tarefa tarefa) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _tarefas.add(tarefa);
  }

  Future<void> alterarTarefa(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _tarefas.where((element) => element.id == id).first.concluido = concluido;
  }

  Future<void> removeTarefa(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _tarefas.remove(_tarefas.where((element) => element.id == id).first);
  }

  Future<List<Tarefa>> listarTarefas() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _tarefas;
  }

  Future<List<Tarefa>> listarTarefasNaoConcluida() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _tarefas.where((element) => !element.concluido).toList();
  }
}
