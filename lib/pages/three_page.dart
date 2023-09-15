import 'package:flutter/material.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({super.key});

  @override
  State<ThreePage> createState() => _OnePageState();
}

class _OnePageState extends State<ThreePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
    );
  }
}
