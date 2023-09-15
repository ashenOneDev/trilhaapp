import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      ),
    );
  }
}
