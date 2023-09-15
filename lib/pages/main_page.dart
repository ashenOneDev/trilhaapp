import 'package:flutter/material.dart';
import 'package:trilhaap/pages/dados_cadastro_page.dart';
import 'package:trilhaap/pages/three_page.dart';
import 'package:trilhaap/pages/two_page.dart';

import 'one_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int posicaoPagina = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      width: double.infinity,
                      child: const Text("Meus Dados")),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DadosCadastroPage(
                                  texto: "Meus Dados",
                                  dados: ["Nome", "Endereço"],
                                )));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      width: double.infinity,
                      child: const Text("Configurações")),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                InkWell(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 5),
                      width: double.infinity,
                      child: const Text("Termos de uso e privacidade")),
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                scrollDirection: Axis.vertical,
                children: const [
                  OnePage(),
                  TwoPage(),
                  ThreePage(),
                ],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(label: "One", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: "Two", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Three", icon: Icon(Icons.person))
                ])
          ],
        ),
      ),
    );
  }
}
