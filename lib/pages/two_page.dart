import 'package:flutter/material.dart';

class TwoPage extends StatefulWidget {
  const TwoPage({super.key});

  @override
  State<TwoPage> createState() => _OnePageState();
}

class _OnePageState extends State<TwoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
    );
  }
}
