import 'package:flutter/material.dart';
import 'package:trilhaap/pages/configuracoes_page.dart';
import 'package:trilhaap/pages/login_page.dart';
import 'package:trilhaap/pages/numeros_aleatorios_page.dart';
import 'package:trilhaap/shared/app_images.dart';

import '../../pages/characters/characters_page.dart';
import '../../pages/dados_cadastro_page.dart';
import '../../pages/posts_page.dart';
import '../../pages/tarefa_http_page.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("camera"),
                          leading: const Icon(Icons.camera),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.folder),
                        ),
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.orange),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(AppImages.dio),
                ),
                accountName: const Text("Iago Cavalcante"),
                accountEmail: const Text("email@email.com")),
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: double.infinity,
                child: const Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.personDrowning,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Meus Dados"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadastroPage()));
            },
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.numbers),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Gerador de números"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) =>
                          const NumerosAleatoriosPage()));
            },
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) => const ConfiguracoesPage()));
            },
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.info),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Termos de uso e privacidade"),
                  ],
                )),
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: const Column(
                        children: [
                          Text(
                            "Termos de uso e privacidade",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    );
                  });
            },
          ),
          const Divider(),
          const SizedBox(
            height: 5,
          ),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.post_add),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Posts"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) => const PostsPage()));
            },
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.power),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Heróis"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) => const CharactersPage()));
            },
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.list),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Tarefas Http"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext bc) => const TarefaHttpPage()));
            },
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(),
          InkWell(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Sair"),
                  ],
                )),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext bc) {
                    return AlertDialog(
                      alignment: Alignment.centerLeft,
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      title: const Text(
                        "Meu App",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Wrap(
                        children: [
                          Text("Deseja realmente sair?"),
                        ],
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Não")),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Sim")),
                      ],
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
