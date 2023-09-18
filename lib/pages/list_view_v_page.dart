import 'package:flutter/material.dart';
import 'package:trilhaap/shared/app_images.dart';

class ListViewVPage extends StatefulWidget {
  const ListViewVPage({super.key});

  @override
  State<ListViewVPage> createState() => _ListViewVPageState();
}

class _ListViewVPageState extends State<ListViewVPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user1),
          title: const Text("User 1"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá! Tudo bem?\nPode falar?"),
              Text("08:59"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              if (menu == "opcao1") {
                debugPrint("Opção 1 clicada");
              } else if (menu == "opcao2") {
                debugPrint("Opção 2 clicada");
              } else if (menu == "opcao3") {
                debugPrint("Opção 3 clicada");
              }
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: "opcao1", child: Text("Opção 1")),
                const PopupMenuItem<String>(
                    value: "opcao2", child: Text("Opção 2")),
                const PopupMenuItem<String>(
                    value: "opcao3", child: Text("Opção 3"))
              ];
            },
          ),
          isThreeLine: true,
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
      ],
    );
  }
}
