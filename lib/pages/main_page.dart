import 'package:flutter/material.dart';
import 'package:trilhaap/pages/three_page.dart';
import 'package:trilhaap/pages/two_page.dart';
import 'package:trilhaap/shared/widgets/custom_drawer.dart';

import 'card_page.dart';

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
                scrollDirection: Axis.vertical,
                children: const [
                  CardPage(),
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
