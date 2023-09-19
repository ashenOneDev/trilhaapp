import 'package:hive/hive.dart';
import 'package:trilhaap/model/tarefa_hive.dart';

class TarefaHiveRepository {
  static late Box _box;

  TarefaHiveRepository._criar();

  static Future<TarefaHiveRepository> carregar() async {
    if (Hive.isBoxOpen('tarefaHive')) {
      _box = Hive.box('tarefaHive');
    } else {
      _box = await Hive.openBox('tarefaHive');
    }
    return TarefaHiveRepository._criar();
  }

  salvar(TarefaHive tarefaHive) {
    _box.add(tarefaHive);
  }

  alterar(TarefaHive tarefaHive) {
    tarefaHive.save();
  }

  remover(TarefaHive tarefaHive) {
    tarefaHive.delete();
  }

  List<TarefaHive> obterDados(bool naoConcluido) {
    if (naoConcluido) {
      return _box.values
          .cast<TarefaHive>()
          .where((element) => !element.concluido)
          .toList();
    }
    return _box.values.cast<TarefaHive>().toList();
  }
}
