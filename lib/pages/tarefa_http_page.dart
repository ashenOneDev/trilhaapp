import 'package:flutter/material.dart';
import 'package:trilhaap/model/tarefas_back4app_model.dart';
import 'package:trilhaap/repositories/back4app/tarefas_back4app_repository.dart';

class TarefaHttpPage extends StatefulWidget {
  const TarefaHttpPage({super.key});

  @override
  State<TarefaHttpPage> createState() => _TarefaHttpPageState();
}

class _TarefaHttpPageState extends State<TarefaHttpPage> {
  TarefasBack4appRepository tarefaRepository = TarefasBack4appRepository();
  var _tarefasBack4app = TarefasBack4appModel([]);
  TextEditingController descricaoController = TextEditingController();
  bool apenasNaoConcluidas = false;
  bool carregando = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() {
      carregando = true;
    });
    _tarefasBack4app = await tarefaRepository.obterTarefas(apenasNaoConcluidas);
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas Http"),
      ),
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
                            Navigator.pop(context);
                            await tarefaRepository.criarTarefa(
                                TarefaBack4appModel.criar(
                                    descricao: descricaoController.text,
                                    concluido: false));

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
            carregando
                ? const CircularProgressIndicator()
                : Expanded(
                    child: ListView.builder(
                        itemCount: _tarefasBack4app.tarefas.length,
                        itemBuilder: (BuildContext bc, int index) {
                          var tarefa = _tarefasBack4app.tarefas[index];
                          return Dismissible(
                            onDismissed:
                                (DismissDirection dismissDirection) async {
                              await tarefaRepository
                                  .removerTarefa(tarefa.objectId);
                              obterTarefas();
                            },
                            key: Key(tarefa.descricao),
                            child: ListTile(
                              title: Text(tarefa.descricao),
                              trailing: Switch(
                                  value: tarefa.concluido,
                                  onChanged: (bool value) async {
                                    tarefa.concluido = value;
                                    await tarefaRepository
                                        .atualizarTarefa(tarefa);
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
