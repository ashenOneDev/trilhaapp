import 'package:flutter/material.dart';
import 'package:trilhaap/model/characters_model.dart';
import 'package:trilhaap/repositories/marvel/marvel_repository.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  ScrollController _scrollController = ScrollController();
  late MarvelRepository marvelRepository;
  CharactersModel characters = CharactersModel();
  int offset = 0;
  bool carregando = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      var posicaoParaPaginar = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels > posicaoParaPaginar) {
        //print("Carregando página");
        carregarDados();
      }
    });
    // TODO: implement initState
    marvelRepository = MarvelRepository();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    if (carregando) return;
    if (characters.data == null || characters.data!.results == null) {
      carregando = true;
      characters = await marvelRepository.getCharacters(offset);
      carregando = false;
    } else {
      setState(() {
        carregando = true;
      });
      offset = offset + characters.data!.count!;
      var tempList = await marvelRepository.getCharacters(offset);
      characters.data!.results!.addAll(tempList.data!.results!);
      carregando = false;
    }
    setState(() {});
  }

  int retornarQuantidadeTotal() {
    try {
      return characters.data!.total!;
    } catch (e) {
      return 0;
    }
  }

  int retornarQuantidadeAtual() {
    try {
      return offset + characters.data!.count!;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                  "Heróis: ${retornarQuantidadeAtual()}/${retornarQuantidadeTotal()}"),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: (characters.data == null ||
                            characters.data!.results == null)
                        ? 0
                        : characters.data!.results!.length,
                    itemBuilder: (_, int index) {
                      var character = characters.data!.results![index];
                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.network(
                              "${character.thumbnail!.path!}.${character.thumbnail!.extension!}",
                              width: 150,
                              height: 150,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      character.name!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(character.description!),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                !carregando
                    ? Center(
                        child: ElevatedButton(
                            onPressed: () {
                              carregarDados();
                            },
                            child: const Text("Próxima página")),
                      )
                    : const CircularProgressIndicator()
              ],
            )));
  }
}
