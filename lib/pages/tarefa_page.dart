import 'package:flutter/material.dart';
import 'package:trilhaap/model/tarefa_hive.dart';
import 'package:trilhaap/repositories/tarefa_hive_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  late TarefaHiveRepository tarefaHiveRepository;
  var _tarefas = const <TarefaHive>[];
  TextEditingController descricaoController = TextEditingController();
  bool apenasNaoConcluidas = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    tarefaHiveRepository = await TarefaHiveRepository.carregar();
    _tarefas = await tarefaHiveRepository.obterDados(apenasNaoConcluidas);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            descricaoController.text = "";
            showDialog(
                context: context,
                builder: (BuildContext bc) {
                  return AlertDialog(
                    title: const Text("Adicionar tarefa"),
                    content: TextField(
                      controller: descricaoController,
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar")),
                      TextButton(
                          onPressed: () async {
                            await tarefaHiveRepository.salvar(TarefaHive.criar(
                                descricaoController.text, false));
                            Navigator.pop(context);
                            obterTarefas();
                            setState(() {});
                          },
                          child: const Text("Salvar"))
                    ],
                  );
                });
          }),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Filtrar não concluidas",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                      value: apenasNaoConcluidas,
                      onChanged: (value) {
                        apenasNaoConcluidas = value;
                        obterTarefas();
                        setState(() {});
                      })
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                      onDismissed: (DismissDirection dismissDirection) async {
                        await tarefaHiveRepository.remover(tarefa);
                        obterTarefas();
                      },
                      key: Key(tarefa.descricao),
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                            value: tarefa.concluido,
                            onChanged: (bool value) async {
                              tarefa.concluido = value;
                              await tarefaHiveRepository.alterar(tarefa);
                              obterTarefas();
                            }),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
