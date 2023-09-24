import 'package:flutter/material.dart';
import 'package:trilhaap/pages/consulta_cep_page.dart';
import 'package:trilhaap/pages/list_view_v_page.dart';
import 'package:trilhaap/pages/image_assets_page.dart';
import 'package:trilhaap/pages/tarefa_page.dart';
import 'package:trilhaap/shared/widgets/custom_drawer.dart';

import 'card_page.dart';
import 'list_view_h_page.dart';

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
        drawer: const CustomDrawer(),
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
                scrollDirection: Axis.horizontal,
                children: const [
                  ConsultaCepPage(),
                  CardPage(),
                  ImageAssetsPage(),
                  ListViewVPage(),
                  ListViewHPage(),
                  TarefaPage(),
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Http", icon: Icon(Icons.download)),
                  BottomNavigationBarItem(
                      label: "Card", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Img Assets", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "List View V", icon: Icon(Icons.person)),
                  BottomNavigationBarItem(
                      label: "List View H", icon: Icon(Icons.telegram)),
                  BottomNavigationBarItem(
                      label: "Tarefas", icon: Icon(Icons.list))
                ])
          ],
        ),
      ),
    );
  }
}
