import 'package:flutter/material.dart';
import 'package:trilhaap/shared/app_images.dart';

class ListViewHPage extends StatefulWidget {
  const ListViewHPage({super.key});

  @override
  State<ListViewHPage> createState() => _ListViewHPageState();
}

class _ListViewHPageState extends State<ListViewHPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Card(elevation: 8, child: Image.asset(AppImages.user1)),
                Card(elevation: 8, child: Image.asset(AppImages.user2)),
                Card(elevation: 8, child: Image.asset(AppImages.user3)),
              ],
            ),
          ),
          Expanded(flex: 3, child: Container())
        ],
      ),
    );
  }
}
